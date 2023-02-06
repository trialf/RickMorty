//
//  CharactersViewModel.swift
//  Rick&Morty
//
//  Created by Adrian Ulgar on 26/10/2022.
//

import Foundation
import UIKit

class CharactersViewModel {
    
    internal init(isLoadingPage: Bool = false, currentSearchQuery: String = "", currentStatus: String = "", currentGender: String = "", currentPage: Int = 1, canLoadMorePages: Bool = true, networkService: NetworkService) {
        self.isLoadingPage = isLoadingPage
        self.currentSearchQuery = currentSearchQuery
        self.currentStatus = currentStatus
        self.currentGender = currentGender
        self.currentPage = currentPage
        self.canLoadMorePages = canLoadMorePages
        self.networkService = networkService
    }
    
    
    private var isLoadingPage = false
    
    var charactersSubject: [Character] = []
    var isFirstLoadingPageSubject: Bool = true
    var currentSearchQuery = ""
    var currentStatus = ""
    var currentGender = ""
    var currentPage = 1
    var canLoadMorePages = true
    
    private var networkService: NetworkService
    
    func getCharacters(completion: @escaping (Bool) -> ()) {
        guard !isLoadingPage && canLoadMorePages else {
            return
        }
        isLoadingPage = true
        let request = CharactersRequest(name: currentSearchQuery, status: currentStatus, gender: currentGender, page: currentPage)

            networkService.getCharacters(request: request) { response in
                let characterResponseModel = response
                if characterResponseModel.pageInfo.pageCount == self.currentPage {
                    self.canLoadMorePages = false
                    return
                }
                
                self.charactersSubject.append(contentsOf: characterResponseModel.results)
                print("Personajes cargados")
                completion(true)
            }
            isLoadingPage = false
            isFirstLoadingPageSubject = false
            if currentPage == 1 {
                charactersSubject.removeAll()
            }

            currentPage += 1
    }
}
