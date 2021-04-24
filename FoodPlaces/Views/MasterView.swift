//
//  MasterView.swift
//  FoodPlaces
//
//  Created by Henry Lee on 22/4/21.
//
// This is the master view - this will contain a navigation view with links to the content
import SwiftUI

struct MasterView: View {
    
    @Binding var title: String
    @ObservedObject var placesVM: ViewModel
    
    @Environment(\.editMode) var editMode

    var body: some View {
        NavigationView{
            ListView(placesVM: placesVM, title: $title)
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
                .navigationBarTitle($title.wrappedValue) // THIS LINE CAUSES AN ERROR "[LayoutConstraints] Unable to simultaneously satisfy constraints."
                                                         //I have no idea why. I thought it was because of the navbar items but removing those doesnt get rid of the error, this is the only thing

        }
    }
}

//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView()
//    }
//}

struct LinkView: View {
    
    var place: Place
    
    @Environment(\.editMode) var editMode
    
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
                    .lineLimit(1)
                Text("Greenslopes")
                    .font(.subheadline)
                
            }
        }
    }
}

struct ListView: View {
    @ObservedObject var placesVM: ViewModel
    @Environment(\.editMode) var editMode
    @Binding var title: String
    var body: some View {
        List {
            
            if editMode?.wrappedValue.isEditing ?? true {
                TextField("Title", text: $title)
                    .font(.title)
            }
            
            ForEach(placesVM.model, id: \.id) { place in
                NavigationLink(
                    destination: ContentView(place: place),
                    label: {
                        LinkView(place: place)
            })}
            .onDelete(perform: { indexSet in
                placesVM.remove(at: indexSet)
            })
            .onMove(perform: { indices, newOffset in
                placesVM.model.move(fromOffsets: indices, toOffset: newOffset)
            })
        }
    }
}
