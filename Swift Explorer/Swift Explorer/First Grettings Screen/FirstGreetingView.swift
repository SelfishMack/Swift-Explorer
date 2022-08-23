//
//  FirstGreetingView.swift
//  Swift Explorer
//
//  Created by Mac on 04.06.2022.
//

import UIKit

/// интерфейс вью приветственного экрана
protocol FirstGreetingViewProtocol {
	/// кнопка перехода на основной экран
	var startButton: UIButton { get }

	/// текстфилд для ввода имени
	var nameTextfield: UITextField { get }

	/// настроить вью приветственного экрана
	func setupView()

	/// показать алерт
	/// - parameter title - заголовок алерта
	/// - parameter message - тело алерта
	func showAlert(with title: String, and message: String)

	/// Нажатие на кнопку ретерн на клавиатуре
	/// - parameter textField текстфилд
	/// - returns bool
	func textFieldShouldReturn(_ textField: UITextField) -> Bool

	/// добавить делегата
	/// - parameter delegate контроллер который будет делегатом
	func addDelegates(delegate : UIViewController)

	/// подготовить вьюконтроллер для перехода на главный экран
	///  - returns вьюконтроллер главного экрана
	func prepareMainScreenViewController() -> UIViewController
}

/// класс вью приветственного экрана
final class FirstGreetingView: UIView, FirstGreetingViewProtocol {

	/// приветственный лейбл
	private let greetingLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: Fonts.primaryText.rawValue, size: 34)
		label.numberOfLines = 0
		label.text = Texts.greetingsFromGreetingScreen.rawValue
		label.textColor = Colors.textPrimary.value
		return label
	}()

	/// текстфилд для ввода имени
	var nameTextfield: UITextField = {
		let textfield = UITextField()
		textfield.translatesAutoresizingMaskIntoConstraints = false
		textfield.backgroundColor = Colors.clicakbleUIElements.value
		textfield.textColor = Colors.textPrimary.value
		let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 20))
		textfield.leftView = paddingView
		textfield.leftViewMode = .always
		let placeholderText = NSAttributedString(
			string: Texts.placeholderFromGreetingScreen.rawValue,
			attributes: [NSAttributedString.Key.foregroundColor: Colors.textSecondary.value])
		textfield.attributedPlaceholder = placeholderText
		textfield.layer.cornerRadius = 10
		return textfield
	}()

	/// кнопка для перехода на следующий экран
	var startButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = Colors.clicakbleUIElements.value
		button.setTitle(Texts.startButtonFromGreetingScreen.rawValue, for: .normal)
		button.setTitle("", for: .highlighted)
		button.layer.cornerRadius = 12
		button.titleLabel?.font = UIFont(name: Fonts.primaryText.rawValue, size: 24)
		return button
	}()

	/// установка цвета фона
	private func setBackgroundColor() {
		backgroundColor = Colors.backgroundPrimary.value
	}

	/// установка иерархии вью
	private func setView() {
		addSubview(greetingLabel)
		addSubview(nameTextfield)
		addSubview(startButton)
	}

	/// установка констрейнов вью
	private func setConstraints() {
		NSLayoutConstraint.activate([
			greetingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
			greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			greetingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			nameTextfield.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 16),
			nameTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			nameTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			nameTextfield.heightAnchor.constraint(equalToConstant: 36),
			startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			startButton.heightAnchor.constraint(equalToConstant: 48)
		])
	}

	func setupView() {
		setBackgroundColor()
		setView()
		setConstraints()
	}

	func showAlert(with title: String, and message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: Texts.alertOk.rawValue,
								   style: .destructive, handler: nil)
		alert.addAction(action)
		parentViewController?.present(alert, animated: true, completion: nil)
	}

	func addDelegates(delegate : UIViewController) {
		nameTextfield.delegate = delegate as? UITextFieldDelegate
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		nameTextfield.resignFirstResponder()
		return true
	}

	func prepareMainScreenViewController() -> UIViewController {
		let mainScreenView = MainScreenView()
		let presenter = MainScreenPresenter(view: mainScreenView)
		let mainViewController = MainScreenViewController(presenter: presenter)
		return mainViewController
	}
}
