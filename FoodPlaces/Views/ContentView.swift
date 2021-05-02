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
                Text("Title")
                    .font(.title2)
                    .bold()
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
                
                Text("Location")
                    .font(.title2)
                    .bold()
                TextField("Location", text: Binding(
                            get: {
                                return place.location
                            },
                            set: {
                                (newValue) in
                                place.location = newValue
                            }),
                          onCommit: {
                            FoodPlacesApp.save(viewModel: viewModel)
                          })
            }
            else {
                Text(place.name)
                    .font(.title)
                    .fontWeight(.heavy)
                Text(place.location)
                    .font(.subheadline)
                    .fontWeight(.heavy)
            }
            
            if editMode?.wrappedValue.isEditing ?? true {
                Text("Image URL")
                    .font(.title2)
                    .bold()
                TextField("URL", text: Binding(
                            get: {
                                return place.imageURL
                            },
                            set: {
                                (newValue) in
                                place.imageURL = newValue
                                place.rawImage = returnDataFromURL(url: place.imageURL)
                            }),
                          onCommit: {
                            FoodPlacesApp.save(viewModel: viewModel)
                          })
            }
            else {
                returnImageFromData(data: place.rawImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(16)
            }
            
            Text("Information")
                .font(.subheadline)
                .fontWeight(.heavy)
            TextEditor(text: Binding(
                        get: {
                            return place.information
                        },
                        set: {
                            (newValue) in
                            place.information = newValue
                        }))
                .frame(minHeight: 100)
            
            
            VStack(alignment: .leading){
                Button("Add"){
                    place.addRecommendation()
                }
                Text("Recomendation")
                    .font(.subheadline)
                    .fontWeight(.heavy)
                
                List{
                    ForEach(place.recommendations, id: \.self) { rec in
                        Text(rec)
                        //Had Issues Allowing Text to be editable
                    }
                    .onDelete(perform: { indexSet in
                        place.recommendations.remove(atOffsets: indexSet)
                        FoodPlacesApp.save(viewModel: viewModel)
                        
                    })
                    .onMove(perform: { indices, newOffset in
                        place.recommendations.move(fromOffsets: indices, toOffset: newOffset)
                        FoodPlacesApp.save(viewModel: viewModel)
                        
                    })
                }
                .frame(minHeight: 300)
                
            }
            .navigationBarItems(trailing: EditButton())
        }
        
    }
}

