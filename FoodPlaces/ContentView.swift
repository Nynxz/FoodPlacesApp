//
//  ContentView.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//
// This is the view our links will link to - it will contain the image, name, location, notes and reviews (list)

import SwiftUI

struct ContentView: View {
    @Binding var place: Place
    var body: some View {
        List{
            Text(place.name)
                .font(.title)
                .fontWeight(.heavy)
            Image(place.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(16)
            TextField("Title", text: $place.name)
            
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: EditButton())
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//        MasterView()
//    }
//}
