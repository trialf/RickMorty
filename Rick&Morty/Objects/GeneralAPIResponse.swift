//
//  GeneralAPIResponse.swift
//  Rick&Morty
//
//  Created by Adrian Ulgar on 26/10/2022.
//

import Foundation

struct GeneralAPIResponse: Decodable {
    let pageInfo: PageInfo
    let results: [Character]
    
    enum CodingKeys: String, CodingKey {
        case pageInfo = "info"
        case results = "results"
    }
}
