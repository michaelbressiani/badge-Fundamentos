//
//  SecureStorageManager.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 22/01/24.
//

import Foundation
import Security

class SecureStorageManager {
    
    private let cardNumbersKeychainService = "Pan CredCard"
    private let cardNumbersKeychainAccount = "CredCardNumbers"
    
    func saveCardNumbersToKeychain(cardsList: [String]) {
            let cardNumbers = cardsList
            if let cardNumbersData = try? JSONEncoder().encode(cardNumbers) {
                let query: [String: Any] = [
                    kSecClass as String: kSecClassGenericPassword,
                    kSecAttrService as String: cardNumbersKeychainService,
                    kSecAttrAccount as String: cardNumbersKeychainAccount,
                    kSecValueData as String: cardNumbersData
                ]
                let status = SecItemAdd(query as CFDictionary, nil)

                if status == errSecSuccess {
                    print("Armazenamento dos números dos cartões no keychain realizado com sucesso.")
                } else if status == errSecDuplicateItem {
                    let updateQuery: [String: Any] = [
                        kSecValueData as String: cardNumbersData
                    ]
                    
                    let updateStatus = SecItemUpdate(query as CFDictionary, updateQuery as CFDictionary)

                    if updateStatus == errSecSuccess {
                        print("Sucesso na atualização dos números dos cartões no Keychain.")
                    }
                } else {
                    print("Houve um erro ao armazenar os números dos cartões no Keychain. Código do erro: \(status)")
                }
            }
        }
}
