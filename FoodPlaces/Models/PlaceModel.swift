//
//  PlaceModel.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//

import Foundation
import SwiftUI

class Place: ObservableObject, Identifiable, Equatable, Codable {

    @Published var id = UUID()
    @Published var name: String
    @Published var image: String
    @Published var location: String
    @Published var information: String
    @Published var imageURL: String
    @Published var rawImage: Data
    @Published var recommendations: [String]
    
    init(name: String, image: String,location: String, imageURL: String, rawImage: Data, information: String, recommendations: [String]){
        self.name = name
        self.image = image
        self.imageURL = imageURL
        self.rawImage = rawImage
        self.location = location
        self.information = information
        self.recommendations = recommendations
    }


    enum CodingKeys: String, CodingKey, RawRepresentable {
        case name
        case image
        case imageURL
        case rawImage
        case location
        case information
        case recommendations
    }

    //Decoding
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        image = try container.decode(String.self, forKey: .image)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        rawImage = try container.decode(Data.self, forKey: .rawImage)
        location = try container.decode(String.self, forKey: .location)
        information = try container.decode(String.self, forKey: .information)
        recommendations = try container.decode([String].self, forKey: .recommendations)

    }

    //Encoding
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(image, forKey: .image)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(rawImage, forKey: .rawImage)
        try container.encode(location, forKey: .location)
        try container.encode(information, forKey: .information)
        try container.encode(recommendations, forKey: .recommendations)

    }
    
    func addRecommendation(){
        self.recommendations.append("New Recommendation")
    }


    //Equatable for Testing
    static func == (lhs: Place, rhs: Place) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.image == rhs.image
    }
}
