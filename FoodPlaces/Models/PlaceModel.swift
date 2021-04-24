//
//  PlaceModel.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//

import Foundation

class Place: ObservableObject, Identifiable, Equatable {

    
    
    var id = UUID()
    var name: String
    var image: String
    
    init(name: String, image: String){
        self.name = name
        self.image = image
    }
    
    //Equatable for Testing
    static func == (lhs: Place, rhs: Place) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.image == rhs.image
    }
}
