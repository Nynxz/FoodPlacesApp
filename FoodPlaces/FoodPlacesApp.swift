//
//  FoodPlacesApp.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//

import SwiftUI

@main
struct FoodPlacesApp: App {
    
    @State var appTitle = "Food Places"
    @ObservedObject var placesViewModel: ViewModel = {
        guard let data = try? Data(contentsOf: FoodPlacesApp.fileURL),
              let model = try? JSONDecoder().decode(ViewModel.self, from: data) else {
            print("Loading Defaults")
            return ViewModel()
        }
        print("Loading Saved")
        //return ViewModel() // FORCE DEFAULT (UNCOMMENT)
        return model
    }()
    
    var body: some Scene {
        WindowGroup {
            MasterView(placesVM: placesViewModel)
        }
    }
    
    static var fileURL: URL {
        let fileName = "places.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return URL(fileURLWithPath: "/") }
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }
    
    
    
    static func save(viewModel: ViewModel) {
        do {
            let data = try JSONEncoder().encode(viewModel)
            try data.write(to: fileURL, options: .atomic)
            guard let dataString = String(data: data, encoding: .utf8) else {
                return
            }
            print("Saved \(dataString)")
        } catch{
            print("Could not write file: \(error)")
        }
    }
}

func returnDataFromURL(url: String) -> Data {
    guard let imageURL = URL(string: url) else {
        fatalError()
    }
    guard let imageData = try? Data(contentsOf: imageURL) else {
        fatalError()
    }
    return imageData
}

func returnImageFromData(data: Data) -> Image {
    guard let uiImage = UIImage(data: data) else {
        return Image("missingimage")
    }
    return Image(uiImage: uiImage)
}

func returnImagefromURL(url: String) -> Image{
    guard let imageURL = URL(string: url) else {
        return Image("missingimage")
    }
    guard let imageData = try? Data(contentsOf: imageURL) else {
        return Image("missingimage")
    }
    guard let uiImage = UIImage(data: imageData) else {
        return Image("missingimage")
    }
    return Image(uiImage: uiImage)
}
