//
//  ContentView.swift
//  Movie in theatres
//
//  Created by Yannis Mavinga on 24/08/2021.
//
import SwiftUI

struct DataModel: Identifiable {
let id: String
let name: String
let imageName: String
}

struct ContentView: View {

    let data: [DataModel] = [
        .init(id: "0", name: "Chat", imageName: "Cat"),
        .init(id: "1", name: "Chien", imageName: "Dog"),
        .init(id: "2", name: "Oiseau", imageName: "Bird"),
        .init(id: "3", name: "Cheval", imageName: "Horse"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data) { items in
                    ForEach(0..<1) { item in
                        CollectionView(data: items)
                    }
                }
            }.navigationBarTitle("Movie in theatres", displayMode: .inline)
        }
    }
}

struct CollectionView: View {
    let data: DataModel
    var body: some View {
        VStack {
                    Spacer()
                    Image(self.data.imageName)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.yellow)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    Spacer()
                .padding(.bottom, 16)
                Text(self.data.name)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .light)
    }
}
