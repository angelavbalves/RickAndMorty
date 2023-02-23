//
//  EpisodesResponse.swift
//  RickAndMorty
//
//  Created by Angela Alves on 06/02/23.
//

import Foundation

struct EpisodesResponse: Codable, Equatable {
    let results: [EpisodeResponseItem]
}

struct EpisodeResponseItem: Codable, Equatable {
    let id: Int
    let name: String
    let episode: String
    let characters: [URL]
}

struct EpisodeResponse: Codable, Equatable {
    let id: Int
    let name: String
    let episode: String
    let characters: [URL]

    init(from response: EpisodeResponseItem) {
        self.id = response.id
        self.name = response.name
        self.episode = response.episode
        self.characters = response.characters
    }
}
