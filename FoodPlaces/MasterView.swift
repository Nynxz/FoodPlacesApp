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
                
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Food Places")
            .navigationBarItems(leading: EditButton(), trailing: Image(systemName: "plus.circle.fill"))
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
