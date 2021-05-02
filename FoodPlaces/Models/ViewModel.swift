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
        self.title = "Food Places"
        self.model = []
        for _ in 0...4{
            self.model.append(Place(
                                name: "Rock and Roll 3",
                                image: "rockandroll",
                                location: "Brisbane",
                                imageURL: "https://cdn.usarestaurants.info/assets/uploads/e065b0011f15d5ff4c23aabfcfe8d4b2_-united-states-illinois-dupage-county-milton-township-carol-stream-95558-augustinos-rock-and-roll-deli-and-grillhtm.jpg",
                                rawImage: returnDataFromURL(url: "https://cdn.usarestaurants.info/assets/uploads/e065b0011f15d5ff4c23aabfcfe8d4b2_-united-states-illinois-dupage-county-milton-township-carol-stream-95558-augustinos-rock-and-roll-deli-and-grillhtm.jpg"),
                                information: "Default Info",
                                recommendations: ["Good Place", "Many Food"]))
        }
        
    }
    
    func addElement() {
        let id = model.count + 1
        let place = Place(
            name: "\(id) Place",
            image: "rockandroll",
            location: "Brisbane",
            imageURL: "https://cdn.usarestaurants.info/assets/uploads/e065b0011f15d5ff4c23aabfcfe8d4b2_-united-states-illinois-dupage-county-milton-township-carol-stream-95558-augustinos-rock-and-roll-deli-and-grillhtm.jpg",
            rawImage: returnDataFromURL(url: "https://cdn.usarestaurants.info/assets/uploads/e065b0011f15d5ff4c23aabfcfe8d4b2_-united-states-illinois-dupage-county-milton-township-carol-stream-95558-augustinos-rock-and-roll-deli-and-grillhtm.jpg"),
            information: "New Information",
            recommendations: ["Good Place", "Many Food"])
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
