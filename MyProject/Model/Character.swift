//
//  Character.swift
//  MyProject
//
//  Created by Nagarro on 2024/07/26.
//

import Foundation
struct Character: Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var gender: String
    var origin: Origin
    var location: Location
    var image: String
}

struct Origin: Codable {
    var name: String
}

struct Location: Codable {
    var name: String
}
