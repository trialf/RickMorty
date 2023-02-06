//
//  Character.swift
//  Rick&Morty
//
//  Created by Adrian Ulgar on 26/10/2022.
//

import Foundation
import UIKit

struct Character: Decodable, Hashable {
    let uuid = UUID()
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let gender: String
    let imageUrl: String
    let created: String
    var statusColor: UIColor {
        switch status {
        case .alive:
            return .green
        case .dead:
            return .red
        case .unknown:
            return .gray
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case status = "status"
        case species = "species"
        case gender = "gender"
        case imageUrl = "image"
        case created = "created"
    }
    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(uuid)
//    }
}

// MARK: - CharacterStatus Enum
extension Character {
    enum CharacterStatus: String, Decodable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }
}
