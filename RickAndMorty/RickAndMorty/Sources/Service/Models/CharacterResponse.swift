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


struct CharacterResponse: Codable, Equatable {
    let id: Int
    let name: String
    let type: String
    let status: String
    let species: String
    let gender: String
    let image: URL
    let origin: Origin

    init(from response: CharacterResponseItem) {
        self.id = response.id
        self.name = response.name
        self.type = response.type
        self.status = response.status
        self.species = response.species
        self.gender = response.gender
        self.image = response.image
        self.origin = response.origin
    }
}

struct Origin: Codable, Equatable {
    let name: String
    let url: String
}

