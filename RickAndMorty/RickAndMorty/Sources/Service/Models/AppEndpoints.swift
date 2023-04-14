//
//  AppEndpoints.swift
//  RickAndMorty
//
//  Created by Angela Alves on 06/02/23.
//

import Foundation

struct AppEndpoints: Decodable, Equatable {
    let characters: URL
    let locations: URL
    let episodes: URL
}
