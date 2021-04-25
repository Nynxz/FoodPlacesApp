//
//  ViewModel.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//

import Foundation

class ViewModel: ObservableObject, Codable {
    
    @Published var model: [Place] = [Place]()
    @Published var title: String
    init(){
        self.model = [
            Place(name: "Rock and Roll 1", image: "rockandroll"),
            Place(name: "Rock and Roll 2", image: "rockandroll"),
            Place(name: "Rock and Roll 3", image: "rockandroll"),
            Place(name: "Rock and Roll 4", image: "rockandroll")
        ]
        self.title = "Food Places"
        
    }
    
    func addElement() {
        let id = model.count + 1
        let place = Place(name: "\(id) Place", image: "rockandroll")
        model.append(place)
    }
    
    func remove(at indices: IndexSet){
        model.remove(atOffsets: indices)
    }
    
    enum CodingKeys: CodingKey {
        case model
        case title
    }
    
    //Encoding
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(model, forKey: .model)
        try container.encode(title, forKey: .title)

    }
    
    //Decoding
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        model = try container.decode([Place].self, forKey: .model)
        title = try container.decode(String.self, forKey: .title)
        print("Model Decoded: \(model) Title: \(title)")
    }
    
}
