//
//  ListView.swift
//  FoodPlaces
//
//  Created by Henry Lee on 2/5/21.
//

import SwiftUI

// ---- LIST VIEW
struct ListView: View {
    @ObservedObject var places: ViewModel
    @Environment(\.editMode) var editMode
    @Binding var title: String
    var body: some View {
        List {
            
            if editMode?.wrappedValue.isEditing ?? true {
                TextField("Title", text: $title,
                          onCommit: {
                              FoodPlacesApp.save(viewModel: places)
                          })
                    .font(.title)
            }
            
            ForEach(places.model) { place in
                NavigationLink(
                    destination: ContentView(place: place, viewModel: places),
                    label: {
                        LinkView(place: place)
            })}
            .onDelete(perform: { indexSet in
                print(places)
                places.model.remove(atOffsets: indexSet)
                FoodPlacesApp.save(viewModel: places)

            })
            .onMove(perform: { indices, newOffset in
                places.model.move(fromOffsets: indices, toOffset: newOffset)
                FoodPlacesApp.save(viewModel: places)

            })
        }
    }
}
