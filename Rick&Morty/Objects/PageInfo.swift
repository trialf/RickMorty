//
//  PageInfo.swift
//  Rick&Morty
//
//  Created by Adrian Ulgar on 26/10/2022.
//

import Foundation

struct PageInfo: Decodable {
    let itemCount: Int
    let pageCount: Int
    let nextPageURL: String?
    let previousPageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case itemCount = "count"
        case pageCount = "pages"
        case nextPageURL = "next"
        case previousPageURL = "prev"
    }
}
