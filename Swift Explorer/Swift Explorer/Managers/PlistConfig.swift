//
//  PlistConfig.swift
//  Swift Explorer
//
//  Created by Mac on 13.06.2022.
//

import Foundation

struct PlistConfig: Decodable {
	private enum CodingKeys: String, CodingKey {
		case title = "Title", body = "Body"
	}

	let title: String
	let body: String
}
