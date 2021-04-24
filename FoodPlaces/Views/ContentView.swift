//
//  ContentView.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//
// This is the view our links will link to - it will contain the image, name, location, notes and reviews (list)

import SwiftUI

struct ContentView: View {
    @ObservedObject var place: Place
    @ObservedObject var viewModel: ViewModel
    @Environment(\.editMode) var editMode
    
    var body: some View {
        List{
            if editMode?.wrappedValue.isEditing ?? true {
                
                TextField("Title", text: Binding(
                    get: {
                        return place.name
                    },
                    set: {
                        (newValue) in
                        place.name = newValue
                    }),
                    onCommit: {
                        FoodPlacesApp.save(viewModel: viewModel)
                    })
            }
            else {
                Text(place.name)
                    .font(.title)
                    .fontWeight(.heavy)
            }

            Image(place.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(16)

        }
        .navigationBarItems(trailing: EditButton())
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//        MasterView()
//    }
//}
