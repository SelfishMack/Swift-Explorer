//
//  Colors.swift
//  MPV_V2.0
//
//  Created by Mac on 29.05.2022.
//

import UIKit

/// константные цвета для приложения
enum Colors {
	/// основной цвет фона
	case backgroundPrimary
	/// цвет основного текста
	case textPrimary
	/// цвет вспомогательного текста
	case textSecondary
	/// цвет фона кликабельных элементов
	case clicakbleUIElements
}

extension Colors {
	var value: UIColor {
		get {
			switch self {
			case .backgroundPrimary:
				return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
			case .textPrimary:
				return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
			case .textSecondary:
				return #colorLiteral(red: 0.5960778594, green: 0.5960789919, blue: 0.6218578815, alpha: 1)
			case .clicakbleUIElements:
				return #colorLiteral(red: 0.1098035797, green: 0.1098041758, blue: 0.122666128, alpha: 1)
			}
		}
	}
}
