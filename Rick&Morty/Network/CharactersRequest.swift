//
//  CharactersRequest.swift
//  Rick&Morty
//
//  Created by Adrian Ulgar on 26/10/2022.
//


final class CharactersRequest: NetworkRequestProtocol {
    
    
    typealias ResponseType = GeneralAPIResponse

    let endpoint: Endpoint
    let method: String = "GET"

    init(name: String, status: String, gender: String, page: Int) {
        endpoint = .getCharacters(name: name, status: status,
                                  gender: gender, page: page)
    }
}
