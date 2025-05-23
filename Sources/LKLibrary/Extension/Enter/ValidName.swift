//
//  ValidName.swift
//  LKLibrary
//
//  Created by Enter M1 on 12/13/24.
//

import Foundation

public enum UsernameValidationError: Error, LocalizedError {
    case invalidLength
    case invalidFirstCharacter
    case invalidLastCharacter
    case consecutiveSpecialCharacters
    case invalidCharacters([Character])
    
    public var errorDescription: String? {
        switch self {
        case .invalidLength:
            return String(localized: "Name must be between 2 and 50 characters long.")
        case .invalidFirstCharacter:
            return String(localized: "Name must start with a letter, number, emoji, apostrophe, or accented letter.")
        case .invalidLastCharacter:
            return String(localized: "Name must end with a letter, number, emoji, apostrophe, or accented letter.")
        case .consecutiveSpecialCharacters:
            return String(localized: "Name cannot contain consecutive special characters.")
        case .invalidCharacters(let chars):
            return String(localized: "Name contains invalid characters: \(String(chars))")
        }
    }
}


extension String {
    public func validateUsername() -> Result<Void, UsernameValidationError> {
        // 1. 检查长度
        guard self.count >= 2 && self.count <= 50 else {
            return .failure(.invalidLength)
        }
        
        // 2. 创建允许的字符集
        let allowedCharacters = CharacterSet.letters
            .union(.decimalDigits)
            .union(CharacterSet(charactersIn: " '·-"))
            .union(.symbols) // 包含 emoji
        
        // 3. 检查是否只包含允许的字符
        let invalidCharacters = self.unicodeScalars.filter { !allowedCharacters.contains($0) }
        if !invalidCharacters.isEmpty {
            return .failure(.invalidCharacters(invalidCharacters.map { Character(String($0)) }))
        }
        
        // 4. 检查首尾字符
        guard let first = self.first, let last = self.last else {
            return .failure(.invalidLength)
        }
        
        let validStartEndChars = CharacterSet.letters
            .union(.decimalDigits)
            .union(CharacterSet(charactersIn: "'"))
            .union(.symbols)
        
        if !validStartEndChars.contains(first.unicodeScalars.first!) {
            return .failure(.invalidFirstCharacter)
        }
        
        if !validStartEndChars.contains(last.unicodeScalars.first!) {
            return .failure(.invalidLastCharacter)
        }
        
        // 5. 检查多余的空格
        guard self.trimmingCharacters(in: .whitespacesAndNewlines) == self,
              !self.contains("  ") else {
            return .failure(.invalidLastCharacter)
        }
        
        // 6. 检查连续的特殊字符
        let specialCharacters = [" ", "'", "-", "·"]
        for (index, char) in self.enumerated() {
            if index < self.count - 1 {
                let nextChar = self[self.index(self.startIndex, offsetBy: index + 1)]
                if specialCharacters.contains(String(char)) && specialCharacters.contains(String(nextChar)) {
                    return .failure(.consecutiveSpecialCharacters)
                }
            }
        }
        
        return .success(())
    }
}
