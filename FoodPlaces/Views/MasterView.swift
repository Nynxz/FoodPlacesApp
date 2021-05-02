//
//  MasterView.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//
// This is the master view - this will contain a navigation view with links to the content
import SwiftUI


struct MasterView: View {
    
    @ObservedObject var placesVM: ViewModel
    @Environment(\.editMode) var editMode
    var body: some View {
        NavigationView{
            ListView(places: placesVM, title: $placesVM.title)
                .navigationBarTitle($placesVM.title.wrappedValue)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: { withAnimation {
                            placesVM.addElement()
                        }},
                        label: {
                            Image(systemName: "plus.circle.fill").foregroundColor(.blue)
                }))
                .listStyle(InsetGroupedListStyle())

        }
    }
}

// ---- PREVIEW
struct MasterView_Previews: PreviewProvider {
    
    static var previews: some View {
        let placesVM = ViewModel()
        MasterView(placesVM: placesVM)
        .preferredColorScheme(.dark)
    }
}
