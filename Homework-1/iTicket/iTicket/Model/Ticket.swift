//
//  Ticket.swift
//  iTicket
//
//  Created by Mert Ozseven on 23.04.2024.
//

import Foundation

struct Ticket {
    var passenger: Passenger
    var date: String
    var hour: Hour?
    var seat: [String]?
    var seatNumber: Int?
    var from: String
    var to: String

}

struct Passenger {
    var name: String
    var surname: String
    var id: String
}

struct Hour {
    var hour: Int
    var minute: Int
}
