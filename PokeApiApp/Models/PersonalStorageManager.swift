//
//  PersonalStorageManager.swift
//  PokeApiApp
//
//  Created by Михаил Фролов on 09.09.2023.
//

import Foundation

protocol StorageManagerProtocol {
    func set(object: Any?, for key: PersonalStorageManager.Keys)
    func string(for key: PersonalStorageManager.Keys) -> String?
    func remove(for key: PersonalStorageManager.Keys)
}

final class PersonalStorageManager {
    public enum Keys: String {
        case name
        case country
    }
    private let userDefaults = UserDefaults.standard
    
    private func store(object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }
    
    private func restore(for key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}

extension PersonalStorageManager: StorageManagerProtocol {
    
    func set(object: Any?, for key: Keys) {
        store(object: object, key: key.rawValue)
    }
    
    func string(for key: Keys) -> String? {
        restore(for: key.rawValue) as? String
    }
    
    func remove(for key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }


}
