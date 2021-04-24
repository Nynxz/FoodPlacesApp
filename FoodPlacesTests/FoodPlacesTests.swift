//
//  FoodPlacesTests.swift
//  FoodPlacesTests
//
//  Created by Henry Lee on 22/4/21.
//

import XCTest
@testable import FoodPlaces

class FoodPlacesTests: XCTestCase {
    
    var simpleTestPlace = Place(name: "Test Place", image: "rockandroll")
    
    var placesViewModel = ViewModel()
    
    func testPlaceName() throws {
        XCTAssertEqual(simpleTestPlace.name, "Test Place")
    }
    func testPlaceImageName() throws {
        XCTAssertEqual(simpleTestPlace.image, "rockandroll")
    }
    
    func testDefaultViewModel() throws {
        XCTAssertEqual(placesViewModel.model[0], Place(name: "Rock and Roll", image: "rockandroll"))
    }


}
