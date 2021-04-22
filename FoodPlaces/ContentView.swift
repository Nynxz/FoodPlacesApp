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
            Text("Rock and Roll")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
            Image("rockandroll")
                .resizable()
                .scaledToFit()
                .cornerRadius(16)
            
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: EditButton())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        MasterView()
    }
}
