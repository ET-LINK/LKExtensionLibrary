//
//  File.swift
//  
//
//  Created by Enter on 2022/5/26.
//

import Foundation

/**
 Describes a Model that can be built by a Builder
 */
public protocol LKBuildableModel {
}

/**
 Describes a Builder. Extends `class` so that set() calls can return self without the compiler complaining about an immutable value. This is for chaining set() and build() calls.
 */
public protocol LKBuilder: AnyObject {
    
    associatedtype FieldType: LKBuilderField  // The type of fields that this builder uses
    associatedtype Model: LKBuildableModel  // The model that a Builder can build
    
    var fields: Set<FieldType> { get set }  // set of fields, essentially all of the values this Builder needs to create a Model
    
    func compare(field: FieldType) throws  // method to override that compares a field to any other field
    
    func makeModel() -> Model  // this method assumes valid fields, and creates a model from them
}

/**
 Describes the fields for a Builder. Extends Hashable to allow the Builder class to store a Set<BuilderField>
 */
public protocol LKBuilderField: Hashable, CustomStringConvertible {
    var fieldName: String { get }
    var value: Any? { get }  // Due to the generic nature of protocol-oriented builder pattern, get the value as Any, the optional nature is due to the fact that builder fields aren't required to be set.
    var isRequired: Bool { get }  // Property that says if the field is required in the Model
    func validate() throws  // Put any validation logic for this field here.  Any comparison logic goes in Builder.compare()
}

extension LKBuilderField {
    var fieldName: String {
        return String(self.hashValue)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(fieldName)
    }
    
}

/**
 Error types that are thrown on build()
 */
public enum LKBuilderError<Field: LKBuilderField>: Error, CustomStringConvertible {
    case missingField(Field)  // field is required, but nil at time of build()
    case invalidField(Field, String)  // failed validation of stand-alone field
    case failedComparison(Field, String)  //  failed comparison of two fields (i.e. password != confirmPassword)
    
    public var description: String {
        switch self {
        case .missingField(let field):
            return "\(field) is missing."
        case .invalidField(let field, let message):
            return "\(field) is invalid: \(message)"
        case .failedComparison(let field, let message):
            return "\(field) comparison failed \(message)"
        }
    }
}

extension LKBuilder {
    
    /**
     Set the value for a field, return self for chaining purposes
    */
    public func set(field: FieldType) -> Self {
        fields.update(with: field)
        return self
    }
    
    /**
     Get the value for a field from the set of fields, because types are known in concrete implementation, the value returned can then be implicitly cast to the correct type.
    */
    public func get(field: FieldType) -> Any? {
        let index = fields.firstIndex(of: field)!
        let builderField = fields[index]
        return builderField.value
    }
    
    private func checkRequired() throws {
        for field in fields {
            if field.value == nil && field.isRequired {
                throw LKBuilderError.missingField(field)
            }
        }
    }
    
    private func validate() throws {
        for field in fields {
            try field.validate()
        }
    }
    
    /**
     If this Builder requires any comparisons, this method can be overridden in concrete implementation
    */
    public func compare(field: FieldType) throws {}
    
    private func compareAll() throws {
        for field in fields {
            try compare(field: field)
        }
    }
    
    /**
     Build the model, ignore any errors, but return nil for an invalid Model
    */
    public func build() -> Model? {
        return try? buildWithErrors()
    }
    
    /**
     Build the model, throw errors for the caller to act on
    */
    public func buildWithErrors() throws -> Model {
        try checkRequired()
        try validate()
        try compareAll()
        return makeModel()
    }
}
