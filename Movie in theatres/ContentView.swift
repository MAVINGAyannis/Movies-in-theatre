//
//  ContentView.swift
//  Movie in theatres
//
//  Created by Yannis Mavinga on 24/08/2021.
//
import SwiftUI

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .light)
    }
}
