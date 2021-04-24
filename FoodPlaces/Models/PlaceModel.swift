//
//  PlaceModel.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//

import Foundation


//struct Place: Identifiable, Decodable {
//    var id = UUID()
//    var name: String
//    var image: String
//}

class Place: ObservableObject, Identifiable, Equatable, Codable {

    @Published var id = UUID()
    @Published var name: String
    @Published var image: String

    init(name: String, image: String){
        self.name = name
        self.image = image
    }


    enum CodingKeys: String, CodingKey, RawRepresentable {
        case name
        case image
    }

    //Decoding
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        image = try container.decode(String.self, forKey: .image)

    }

    //Encoding
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(image, forKey: .image)

    }


    //Equatable for Testing
    static func == (lhs: Place, rhs: Place) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.image == rhs.image
    }
}
