//
//  MainScreenViewController.swift
//  Swift Explorer
//
//  Created by Mac on 05.06.2022.
//

import UIKit

/// Класс контроллер главного экрана
final class MainScreenViewController: UIViewController {

	/// презентер главного экрана
	let presenter: MainScreenPresenterProtocol

	/// инициализатор
	/// - parameter presenter - презентер главного экрана
	init(presenter: MainScreenPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view = presenter.view as? UIView
		presenter.viewDidLoad()
	}
}
