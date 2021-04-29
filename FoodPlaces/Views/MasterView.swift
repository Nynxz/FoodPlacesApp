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
                .navigationBarTitle($placesVM.title.wrappedValue) // THIS LINE CAUSES AN ERROR "[LayoutConstraints] Unable to simultaneously satisfy constraints."
                                                         //I have no idea why. I thought it was because of the navbar items but removing those doesnt get rid of the error, this is the only thing
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



// ---- LINK VIEW
struct LinkView: View {
        
    @Environment(\.editMode) var editMode
    
    @ObservedObject var placeO: Place
    
    var body: some View {
        HStack{
            Image(placeO.image)
                .resizable()
                .frame(width: 64, height: 64, alignment: .leading)
                .cornerRadius(8)
                .padding(.leading, -8)
            VStack(alignment: .leading){
                Text(placeO.name)
                    .font(.headline)
                    .lineLimit(1)
                Text("Greenslopes")
                    .font(.subheadline)
                
            }
        }
    }
}


// ---- LIST VIEW
struct ListView: View {
    @ObservedObject var places: ViewModel
    @Environment(\.editMode) var editMode
    @Binding var title: String
    var body: some View {
        List {
            
            if editMode?.wrappedValue.isEditing ?? true {
                TextField("Title", text: $title,
                          onCommit: {
                              FoodPlacesApp.save(viewModel: places)
                          })
                    .font(.title)
            }
            
            ForEach(places.model) { place in
                NavigationLink(
                    destination: ContentView(place: place, viewModel: places),
                    label: {
                        LinkView(placeO: place)
            })}
            .onDelete(perform: { indexSet in
                print(places)
                places.model.remove(atOffsets: indexSet)
                FoodPlacesApp.save(viewModel: places)

            })
            .onMove(perform: { indices, newOffset in
                places.model.move(fromOffsets: indices, toOffset: newOffset)
                FoodPlacesApp.save(viewModel: places)

            })
        }
    }
}
