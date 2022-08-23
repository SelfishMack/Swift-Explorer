//
//  UserDefault.swift
//  Swift Explorer
//
//  Created by Mac on 05.06.2022.
//

import Foundation

/// ключи для userDefaults
enum KeysForUserDefaults: String {
	case name
}

/// класс для обработки данных из userDefaults
final class UserData {
	/// инстантс userdefaults
	private static let userDefaults = UserDefaults.standard
	
	/// загрузить данные
	static func loadData() -> String? {
		return userDefaults.string(forKey: KeysForUserDefaults.name.rawValue)
	}

	/// сохранить данные
	///  - parameter name имя пользователя
	static func saveData(name: String) {
		userDefaults.set(name, forKey: KeysForUserDefaults.name.rawValue)
	}

	private init() {}
}
