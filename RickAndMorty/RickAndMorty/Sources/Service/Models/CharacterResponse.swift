//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Angela Alves on 06/02/23.
//

import Foundation

struct CharactersResponse: Codable, Equatable {
    let results: [CharacterResponseItem]
}

struct CharacterResponseItem: Codable, Equatable {
    let id: Int
    let name: String
    let type: String
    let status: String
    let species: String
    let gender: String
    let image: URL
    let origin: Origin
}

struct Origin: Codable, Equatable {
    let name: String
    let url: String
}

