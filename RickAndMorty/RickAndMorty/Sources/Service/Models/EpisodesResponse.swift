//
//  EpisodesResponse.swift
//  RickAndMorty
//
//  Created by Angela Alves on 06/02/23.
//

import Foundation

struct EpisodesResponse: Codable, Equatable {
    let results: [EpisodeResponse]
}

struct EpisodeResponse: Codable, Equatable {
    let id: Int
    let name: String
    let episode: String
    let characters: [URL]
}
