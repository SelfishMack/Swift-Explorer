//
//  FirstGreetingPresenter.swift
//  Swift Explorer
//
//  Created by Mac on 04.06.2022.
//

import Foundation

/// интерфейс презентера приветственного экрана
protocol FirstGreetingPresenterProtocol {
	/// вью приветственного экрана
	var view: FirstGreetingViewProtocol { get }

	/// вспомогательный метод для отработки первичной настройки после того как вью загружена в память
	func viewDidLoad()
}

/// класс презентер приветственного экрана
final class FirstGreetingPresenter: FirstGreetingPresenterProtocol {
	var view: FirstGreetingViewProtocol

	/// данные по пользователю хранящиеся в userdefaults
	var userData = UserData.self

	/// инициализатор
	/// - parameter view вью приветственного экрана
	init(view: FirstGreetingViewProtocol) {
		self.view = view
	}

	func viewDidLoad() {
		view.setupView()
		addTargets()
	}

	/// Проверить имя на легальность и показать алерт либо перейти на следующий экран
	func checkNameFromTextField() {
		if checkIsIllegalCharacters() {
			view.startButton.parentViewController?.show(view.prepareMainScreenViewController(),sender: nil)
		} else {
			view.showAlert(with: Texts.alertTitleWarning.rawValue, and: Texts.alertWarning.rawValue)
		}
	}

	/// доставить таргет для кнопки startButton
	private func addTargets() {
		view.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
	}

	/// перейти на следующий экран по нажатию на startButton
	@objc private func startButtonTapped() {
		checkNameFromTextField()
	}

	/// проверить текст на легальность и сохранить их в случае легальности
	private func checkIsIllegalCharacters() -> Bool {
		let textfield = view.nameTextfield
		guard let text = textfield.text, text.count != 0 else { return false }
		let decimalCharacters = CharacterSet.decimalDigits
		let illegalCharacters = CharacterSet.illegalCharacters
		let newLines = CharacterSet.newlines
		let punctuationCharacters = CharacterSet.punctuationCharacters
		let symbols = CharacterSet.symbols

		let illegals = [decimalCharacters, illegalCharacters, newLines, punctuationCharacters, symbols]
		for illegal in illegals {
			let illegalRange = text.rangeOfCharacter(from: illegal)
			if illegalRange != nil {
				return false
			}
		}
		userData.saveData(name: text)
		return true
	}
}
