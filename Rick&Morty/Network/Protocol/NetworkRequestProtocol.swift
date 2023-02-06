//
//  NetworkRequestProtocol.swift
//  Rick&Morty
//
//  Created by Adrian Ulgar on 26/10/2022.
//
protocol NetworkRequestProtocol {
    associatedtype ResponseType: Decodable
    
    var endpoint: Endpoint { get }
    var method: String { get }
}
