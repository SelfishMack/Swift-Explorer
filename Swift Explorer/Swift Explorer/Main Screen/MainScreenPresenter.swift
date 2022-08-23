//
//  MainScreenPresenter.swift
//  Swift Explorer
//
//  Created by Mac on 13.06.2022.
//

import Foundation

/// интерфейс презентера главного экрана
protocol MainScreenPresenterProtocol {
	/// вью главного экрана
	var view: MainScreenViewProtocol { get }

	/// вспомогательный метод для отработки первичной настройки после того как вью загружена в память
	func viewDidLoad()
}

/// класс презентер главного экрана
final class MainScreenPresenter: MainScreenPresenterProtocol {

	var view: MainScreenViewProtocol

	/// инициализатор
	/// - parameter view вью приветственного экрана
	init(view: MainScreenViewProtocol) {
		self.view = view
	}

	func viewDidLoad() {
		view.setupView()
		// TODO: - времянка для проверки получения данных из плиста
		let config = parseConfig()
		print(config.title)
		print(config.body)
	}

	/// парсинг ПлистФайла
	/// - returns возвращает полноценный объект типа заданого в PlistConfig
	func parseConfig() -> PlistConfig {
		let url = Bundle.main.url(forResource: "Articles", withExtension: "plist")!
		let data = try! Data(contentsOf: url)
		let decoder = PropertyListDecoder()
		return try! decoder.decode(PlistConfig.self, from: data)
	}
}
