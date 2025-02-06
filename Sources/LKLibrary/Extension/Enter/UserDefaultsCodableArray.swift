//
//  UserDefaultsCodableArray.swift
//  LKLibrary
//
//  Created by Enter M1 on 12/17/24.
//


import Foundation

@propertyWrapper
public struct LTUserDefault<T> {
    let key: String
    let defaultValue: T
    
    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: T {
        get { UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}


@propertyWrapper
public struct LTUserDefaultsCodableArray<T: Codable> {
    private let key: String
    private let defaultValue: [T]
    
    public init(key: String, defaultValue: [T] = []) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: [T] {
        get {
            guard let data = UserDefaults.standard.data(forKey: key) else {
                return defaultValue
            }
            
            do {
                return try JSONDecoder().decode([T].self, from: data)
            } catch {
                print("Error decoding \(T.self) array: \(error)")
                return defaultValue
            }
        }
        set {
            do {
                let data = try JSONEncoder().encode(newValue)
                UserDefaults.standard.set(data, forKey: key)
            } catch {
                print("Error encoding \(T.self) array: \(error)")
            }
        }
    }
}
