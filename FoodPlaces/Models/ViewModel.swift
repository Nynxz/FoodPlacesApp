//
//  ViewModel.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var model = [Place]()
    
    init(){
        self.model = [
            Place(name: "Rock and Roll", image: "rockandroll"),
            Place(name: "Rock and Roll2.0", image: "rockandroll"),
            Place(name: "Rock and Roll2.0", image: "rockandroll"),
            Place(name: "Rock and Roll2.0", image: "rockandroll")
        ]
        
    }
    
    func addElement() {
        let id = model.count + 1
        let place = Place(name: "\(id) Place", image: "rockandroll")
        model.append(place)
    }
    
    func remove(at indices: IndexSet){
        model.remove(atOffsets: indices)
    }
    
}
