//
//  UIView + ParentViewController Extension.swift
//  Swift Explorer
//
//  Created by Mac on 05.06.2022.
//

import UIKit

extension UIView {
	var parentViewController: UIViewController? {
		var parentResponder: UIResponder? = self.next

		while parentResponder != nil {
			if let viewController = parentResponder as? UIViewController {
				return viewController
			}
			parentResponder = parentResponder?.next
		}
		return nil
	}
}
