//
//  FoodPlacesApp.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//

import SwiftUI

@main
struct FoodPlacesApp: App {
    
    //Our App Title
    @State var appTitle = "Food Places"
    //Our Main Data
    @StateObject var placesViewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            MasterView(title: $appTitle, placesVM: placesViewModel)
        }
    }
}
