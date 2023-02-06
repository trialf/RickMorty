//
//  NetworkServiceProtocol.swift
//  Rick&Morty
//
//  Created by Adrian Ulgar on 26/10/2022.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func getCharacters(request: CharactersRequest, completiongWithResponse: @escaping (GeneralAPIResponse)->())
}
