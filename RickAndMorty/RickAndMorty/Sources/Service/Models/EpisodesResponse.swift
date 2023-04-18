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
    let airDate: String
    let characters: [URL]
}
