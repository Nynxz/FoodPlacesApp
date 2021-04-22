//
//  MasterView.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//
// This is the master view - this will contain a navigation view with links to the content
import SwiftUI

struct MasterView: View {
    @Binding var places: [Place]
    var body: some View {
        NavigationView{
            List{
                ForEach(0..<places.count) { i in
                    NavigationLink(
                        destination: ContentView(place: $places[i]),
                        label: {
                            LinkView(place: $places[i])
                    })
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Food Places")
            .navigationBarItems(leading: EditButton(), trailing: Image(systemName: "plus.circle.fill").foregroundColor(.blue))
            
        }
    }
}

//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView()
//    }
//}

struct LinkView: View {
    @Binding var place: Place
    var body: some View {
        HStack{
            Image(place.image)
                .resizable()
                .frame(width: 64, height: 64, alignment: .leading)
                .cornerRadius(8)
                .padding(.leading, -8)
            VStack(alignment: .leading){
                Text(place.name)
                    .font(.headline)
                Text("Greenslopes")
                    .font(.subheadline)
            }
        }
    }
}
