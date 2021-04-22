//
//  ContentView.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//
// This is the view our links will link to - it will contain the image, name, location, notes and reviews (list)

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            Image("rockandroll")
                .resizable()
                .scaledToFit()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
