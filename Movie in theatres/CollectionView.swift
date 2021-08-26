//
//  CollectionView.swift
//  Movie in theatres
//
//  Created by Yannis Mavinga on 26/08/2021.
//

// Vue contenant la liste déroulante des films

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
                        VStack(spacing: 10) {
                            Text(self.data.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 17, weight: .heavy, design: .default))
                            Text(self.data.release)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 16, design: .default))
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
