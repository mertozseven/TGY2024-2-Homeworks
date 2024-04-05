//
//  User.swift
//  03-04-2024-homework
//
//  Created by Mert Ozseven on 5.04.2024.
//

import Foundation

struct User: Decodable {
    let id: Int?
    let name: String?
}

struct User2: Encodable {
    let username: String?
    let password: String?
}
