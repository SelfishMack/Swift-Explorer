//
//  FirstGreetingViewController.swift
//  Swift Explorer
//
//  Created by Mac on 29.05.2022.
//

import UIKit

/// Вьюконтроллер приветственного экрана
class FirstGreetingViewController: UIViewController {
	/// презентер приветственного экрана
	let presenter: FirstGreetingPresenterProtocol

	/// инициализатор
	/// - parameter presenter - презентер приветственного экрана
	init(presenter: FirstGreetingPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		view = presenter.view as? UIView
		presenter.viewDidLoad()
		presenter.view.addDelegates(delegate: self)
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
}

// MARK: - UITextFieldDelegate
extension FirstGreetingViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		presenter.view.textFieldShouldReturn(textField)
	}
}
