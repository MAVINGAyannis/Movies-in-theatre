//
//  ChoosedMovie.swift
//  Movie in theatres
//
//  Created by Yannis Mavinga on 26/08/2021.
//

import Foundation
import SwiftUI

// Vue détaillé sur le film choisi après sélection

struct Choosed_movie: View {
    let data: DataModel

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 80) {
                HStack(alignment: .top, spacing: 20) {
                    Image(self.data.poster)
                    .resizable()
                    .frame(width: 150, height: 220, alignment: .top)
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
                    
                    }
                }
                Divider()
                HStack {
                    Text(self.data.synopsis)
                    .frame(maxWidth: .infinity)
                }
                Divider()
                HStack {
                    Text("Trailer indisponible")
                    .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16, weight: .light, design: .default))
                }
            }
        }
    }
}
