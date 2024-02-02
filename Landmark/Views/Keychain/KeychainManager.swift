//
//  KeychainManager.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 10.11.2023.
//

import Foundation

class KeychainManager {

    private init() {

    }

    static let shared: KeychainManager = KeychainManager()

    static func saveCredentials(password: Data, email: String) throws -> String {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: email,
            kSecValueData: password
        ]

        let status = SecItemAdd(query as CFDictionary, nil)

        guard status != errSecDuplicateItem else {
            throw KeychainError.duplicateItem
        }

        guard status != errSecDuplicateItem else {
            throw KeychainError.unknown(status: status)
        }

        return "Saved"
    }

    static func getPassword(for email: String) throws -> Data? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: email,
            kSecReturnData: kCFBooleanTrue as Any,
            kSecMatchLimit: kSecMatchLimitOne
        ]

        var result: AnyObject?
                                    //here inline and that changed our result
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess else {
            print("guard status error \(status)")
            throw KeychainError.unknown(status: status)
        }

        return result as? Data
    }

    static func getPasswordsForAllEmails() throws -> [Data] {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: kCFBooleanTrue as Any,
            kSecMatchLimit: kSecMatchLimitAll
        ]

        var items: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &items)

        guard status == errSecSuccess else {
            throw KeychainError.unknown(status: status)
        }
        guard let items = items as? [[CFString: Any]] else {
            return []
        }
        var passwords: [Data] = []
        for item in items {
            if let data = item[kSecValueData] as? Data {
                passwords.append(data)
            }
        }
        return passwords
    }
}
