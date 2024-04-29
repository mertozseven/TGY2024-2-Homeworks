//
//  Ticket.swift
//  iTicket
//
//  Created by Mert Ozseven on 23.04.2024.
//

import Foundation

struct Ticket: Encodable, Decodable {
    var passenger: Passenger
    var date: String
    var hour: Hour?
    var seat: [String]?
    var seatNumber: Int?
    var from: String
    var to: String
}

struct Passenger: Encodable, Decodable {
    var name: String
    var surname: String
    var id: String
}

struct Hour: Encodable, Decodable {
    var hour: Int
    var minute: Int
}
