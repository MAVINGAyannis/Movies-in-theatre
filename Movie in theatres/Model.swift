//
//  Model.swift
//  Movie in theatres
//
//  Created by Yannis Mavinga on 26/08/2021.
//

// Modèle récupérant les données de JSON_files.swift

import Foundation
import SwiftUI

struct DataModel: Identifiable {
    let id: String
    let title: String
    let poster: String
    let release: String
    let synopsis: String
}
