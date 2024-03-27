//
//  User.swift
//  25-03-2024-homework
//
//  Created by Mert Ozseven on 26.03.2024.
//

import Foundation

struct User: Decodable {
    
    let name: String?
    let username: String?
    let email: String?
    let company: Company?

}


struct Company: Decodable {
    let name: String?
}
