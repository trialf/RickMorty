//
//  CharacterTest.swift
//  Rick&MortyTests
//
//  Created by Adrian Ulgar on 04/02/2023.
//

import XCTest
@testable import Rick_Morty

final class CharacterTest: XCTestCase {

    func testCharacter() throws {
        let sut = Character.init(id: 1, name: "test", status: .alive, species: "human", gender: "male", imageUrl: "testImageUrl", created: "10-10-2022")
        
        XCTAssertEqual(sut.id, 1)
        XCTAssertEqual(sut.name, "test")
        XCTAssertEqual(sut.status, .alive)
    }


}
