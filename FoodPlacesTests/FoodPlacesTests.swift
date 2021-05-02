//
//  FoodPlacesTests.swift
//  FoodPlacesTests
//
//  Created by Henry Lee on 22/4/21.
//

import XCTest
@testable import FoodPlaces

class FoodPlacesTests: XCTestCase {
    
    var simpleTestPlace = Place(
        name: "Rock and Roll 3",
        image: "rockandroll",
        location: "Brisbane",
        imageURL: "https://cdn.usarestaurants.info/assets/uploads/e065b0011f15d5ff4c23aabfcfe8d4b2_-united-states-illinois-dupage-county-milton-township-carol-stream-95558-augustinos-rock-and-roll-deli-and-grillhtm.jpg",
        rawImage: returnDataFromURL(url: "https://cdn.usarestaurants.info/assets/uploads/e065b0011f15d5ff4c23aabfcfe8d4b2_-united-states-illinois-dupage-county-milton-township-carol-stream-95558-augustinos-rock-and-roll-deli-and-grillhtm.jpg"),
        information: "Default Info",
        recommendations: ["Good Place", "Many Food"])
    
    var placesViewModel = ViewModel()
    
    func testPlaceName() throws {
        XCTAssertEqual(simpleTestPlace.name, "Rock and Roll 3")
    }
    func testPlaceImageName() throws {
        XCTAssertEqual(simpleTestPlace.image, "rockandroll")
    }
    
    func testDefaultViewModel() throws {
        XCTAssertEqual(placesViewModel.model[0], Place(
                        name: "Rock and Roll 3",
                        image: "rockandroll",
                        location: "Brisbane",
                        imageURL: "https://cdn.usarestaurants.info/assets/uploads/e065b0011f15d5ff4c23aabfcfe8d4b2_-united-states-illinois-dupage-county-milton-township-carol-stream-95558-augustinos-rock-and-roll-deli-and-grillhtm.jpg",
                        rawImage: returnDataFromURL(url: "https://cdn.usarestaurants.info/assets/uploads/e065b0011f15d5ff4c23aabfcfe8d4b2_-united-states-illinois-dupage-county-milton-township-carol-stream-95558-augustinos-rock-and-roll-deli-and-grillhtm.jpg"),
                        information: "Default Info",
                        recommendations: ["Good Place", "Many Food"]))
    }
    
    func testViewModelAddElement() throws {
        let placesViewModelTemp = ViewModel()
        let currentLength = placesViewModelTemp.model.count
        placesViewModelTemp.addElement()
        XCTAssertEqual(placesViewModelTemp.model[currentLength], Place(
                        name: "\(currentLength+1) Place",
                        image: "rockandroll",
                        location: "Brisbane",
                        imageURL: "https://cdn.usarestaurants.info/assets/uploads/e065b0011f15d5ff4c23aabfcfe8d4b2_-united-states-illinois-dupage-county-milton-township-carol-stream-95558-augustinos-rock-and-roll-deli-and-grillhtm.jpg",
                        rawImage: returnDataFromURL(url: "https://cdn.usarestaurants.info/assets/uploads/e065b0011f15d5ff4c23aabfcfe8d4b2_-united-states-illinois-dupage-county-milton-township-carol-stream-95558-augustinos-rock-and-roll-deli-and-grillhtm.jpg"),
                        information: "New Information",
                        recommendations: ["Good Place", "Many Food"]))
    }
    


}
