//
//  MainScreenView.swift
//  Swift Explorer
//
//  Created by Mac on 13.06.2022.
//

import UIKit

/// интерфейс вью главного экрана
protocol MainScreenViewProtocol {

	/// настроить вью главного экрана
	func setupView()
}

final class MainScreenView: UIView, MainScreenViewProtocol {

	// TODO: - временный лейбл, убрать 
	var temporaryLabel: UILabel = {
		let label = UILabel()
		label.textColor = Colors.textPrimary.value
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	func setupView() {
		backgroundColor = Colors.backgroundPrimary.value
		setViews()
		setConstraints()
		// TODO: - времянка для получения данных из userdefaults
		temporaryLabel.text = UserData.loadData()
		// TODO: - времянка для того чтобы убрать навигацию на экран greetings
		self.parentViewController?.navigationItem.setHidesBackButton(true, animated: true)
	}

	/// установка иерархии вью
	private func setViews() {
		addSubview(temporaryLabel)
	}

	/// установка констрейнов вью
	private func setConstraints() {
		NSLayoutConstraint.activate([
			temporaryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
			temporaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
		])
	}
}
