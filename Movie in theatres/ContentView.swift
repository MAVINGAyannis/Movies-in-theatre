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

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct ContentView: View {
    
    let data: [DataModel] = [
        .init(id: "0", name: "Movie 1", imageName: "Cat"),
        .init(id: "1", name: "Movie 2", imageName: "Dog"),
        .init(id: "2", name: "Movie 3", imageName: "Bird"),
        .init(id: "3", name: "Movie 4", imageName: "Horse"),
    ]
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "NotoSansKannada-Bold", size: 20)!]
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data) { items in
                    CollectionView(data: items)
                }
            }.navigationBarTitle (Text("Actuellement à l'affiche"), displayMode: .inline)
            .background(NavigationConfigurator { nc in
                            nc.navigationBar.barTintColor = .blue
                            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct CollectionView: View {
    let data: DataModel

    var body: some View {
        VStack {
            Spacer()
                .padding(.bottom, 16)
            NavigationLink(destination: Choosed_movie(data: data)){
                VStack(spacing: 30) {
                    HStack(spacing: 20) {
                        Image(self.data.imageName)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .shadow(radius: 10)
                        VStack {
                            Text(self.data.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Sortie : ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            .padding(.bottom, 10)
                        }
                    }
                    HStack {
                        Text("Film action interdit au moins de 18 ans")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }

    struct Choosed_movie: View {
        let data: DataModel

        var body: some View {
            VStack(alignment: .leading, spacing: 120) {
                HStack(alignment: .top, spacing: 20) {
                    Image(self.data.imageName)
                    .resizable()
                        .frame(width: 150, height: 150, alignment: .top)
                    .foregroundColor(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .shadow(radius: 10)
                     VStack {
                        Text(self.data.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Date de sortie")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                }
                Divider()
                HStack {
                    Text("Synopsis")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Divider()
                HStack {
                    Text("Trailer")
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .light)
    }
}
