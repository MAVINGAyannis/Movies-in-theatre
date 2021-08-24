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
        .init(id: "0", name: "Movie 1", imageName: "Cat"),
        .init(id: "1", name: "Movie 2", imageName: "Dog"),
        .init(id: "2", name: "Movie 3", imageName: "Bird"),
        .init(id: "3", name: "Movie 4", imageName: "Horse"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data) { items in
                    ForEach(0..<1) { item in
                        CollectionView(data: items)
                    }
                }
            }.navigationBarTitle("Actuellement à l'affiche", displayMode: .inline)
        }
    }
}

struct CollectionView: View {
    let data: DataModel
    @State private var showingAlert = false
    @State private var MovieChoosed = 0

    var body: some View {
        VStack {
                    Spacer()
                    NavigationLink(destination: Text("Film choisi")){
                    Image(self.data.imageName)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .shadow(radius: 10)
            }
                    Spacer()
                .padding(.bottom, 16)
                Text(self.data.name)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Movie choosed !"), message: Text("Movie description here"), dismissButton: .default(Text("Continue")) {
            })
        }
    }

    func MovieChoosed(_ MovieChoosed: Int) {
        showingAlert = true
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .light)
    }
}
