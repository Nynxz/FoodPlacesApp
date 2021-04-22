//
//  FoodPlacesApp.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//

import SwiftUI

@main
struct FoodPlacesApp: App {
    @State var model = [Place(name: "Rock and Roll", image: "rockandroll"), Place(name: "Rock and Roll2.0", image: "rockandroll"), Place(name: "Rock and Roll2.0", image: "rockandroll"), Place(name: "Rock and Roll2.0", image: "rockandroll")]
    
    var body: some Scene {
        WindowGroup {
            MasterView(places: $model)
        }
    }
}
