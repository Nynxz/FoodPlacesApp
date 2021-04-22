//
//  MasterView.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//
// This is the master view - this will contain a navigation view with links to the content
import SwiftUI

struct MasterView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(
                    destination: ContentView(),
                    label: {
                        LinkView()
                    })
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Food Places")
            .navigationBarItems(leading: EditButton(), trailing: Image(systemName: "plus.circle.fill").foregroundColor(.blue))
            
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}

struct LinkView: View {
    var body: some View {
        HStack{
            Image("rockandroll")
                .resizable()
                .frame(width: 64, height: 64, alignment: .leading)
                .cornerRadius(8)
                .padding(.leading, -8)
            VStack(alignment: .leading){
                Text("Rock and Roll")
                    .font(.headline)
                Text("Greenslopes")
                    .font(.subheadline)
            }
        }
    }
}
