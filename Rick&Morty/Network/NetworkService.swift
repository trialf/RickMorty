//
//  NetworkService.swift
//  Rick&Morty
//
//  Created by Adrian Ulgar on 26/10/2022.
//

import Foundation
import Alamofire

class NetworkService: NetworkServiceProtocol {
    
    
    func getCharacters(request: CharactersRequest, completiongWithResponse: @escaping (GeneralAPIResponse)->()) {
        AF.request(request.endpoint.url, method: .get, encoding: JSONEncoding.default ).responseDecodable(of: GeneralAPIResponse.self)  { response in
            switch response.result {
               case .success(let post):
                   print("Recieved post: \(post)")
                completiongWithResponse(post)
               case .failure(let error):
                   print("Failed with error: \(error)")
               }
        }
    }
}
