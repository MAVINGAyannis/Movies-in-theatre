//
//  CollectionView.swift
//  Movie in theatres
//
//  Created by Yannis Mavinga on 26/08/2021.
//

import Foundation
import SwiftUI

struct CollectionView: View {
    let data: DataModel

    var body: some View {
        VStack() {
            NavigationLink(destination: Choosed_movie(data: data)){
                VStack() {
                    HStack(spacing: 20) {
                        Image(self.data.poster)
                        .resizable()
                        .frame(width: 100, height: 150)
                        .foregroundColor(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .shadow(radius: 10)
                        VStack {
                            Text(self.data.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(self.data.release)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            .padding(.bottom, 10)
                        }
                    }
                    HStack {
                        Text(self.data.synopsis)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
}
