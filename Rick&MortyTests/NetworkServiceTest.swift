//
//  Rick_MortyTests.swift
//  Rick&MortyTests
//
//  Created by Adrian Ulgar on 04/02/2023.
//

import XCTest
@testable import Rick_Morty

class NetworkServiceTest: XCTestCase {
    func testGetCharactersTest() throws {
        let sut = CharactersViewModel.init(networkService: NetworkService())
        sut.getCharacters { succes in
            if succes {
                XCTAssertGreaterThan(sut.charactersSubject.count, 0)
            } else {
                XCTAssertEqual(sut.charactersSubject.count, 0)
            }
        }
    }


}
