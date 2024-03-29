//
//  LocationsResponse.swift
//  RickAndMorty
//
//  Created by Angela Alves on 06/02/23.
//

import Foundation

struct LocationsResponse: Codable, Equatable {
    let results: [LocationResponseItem]
}

struct LocationResponseItem: Codable, Equatable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [URL]
}
