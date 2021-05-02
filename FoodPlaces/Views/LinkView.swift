//
//  LinkView.swift
//  FoodPlaces
//
//  Created by Henry Lee on 2/5/21.
//

import SwiftUI

struct LinkView: View {
        
    @Environment(\.editMode) var editMode
    
    @ObservedObject var place: Place
    
    var body: some View {
        HStack{
            returnImageFromData(data: place.rawImage)      .resizable()
                .frame(width: 64, height: 64, alignment: .leading)
                .cornerRadius(8)
                .padding(.leading, -8)
            VStack(alignment: .leading){
                Text(place.name)
                    .font(.headline)
                    .lineLimit(1)
                Text(place.location)
                    .font(.subheadline)
                
            }
        }
    }
}

