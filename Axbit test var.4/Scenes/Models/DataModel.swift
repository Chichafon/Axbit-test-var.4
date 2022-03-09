//
//  DataModel.swift
//  Axbit test var.4
//
//  Created by 111 on 09.03.2022.
//

import Foundation

struct DataModel: Decodable {
    var resultCount: Int
    var results: [DataTypes]
}

struct DataTypes: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl100: String?
}
