//
//  RickAndMortyEndpoints.swift
//  Project01
//
//  Created by Angela Alves on 12/04/23.
//

import Foundation

enum RickAndMortyEndpoints {
    case characters
    case locations
    case episodes
}

extension RickAndMortyEndpoints: EndpointProtocol {
    var host: String {
        "rickandmortyapi.com"
    }

    var method: String {
        "GET"
    }

    var path: String {
        switch self {
            case .characters:
                return "/api/character"
            case .locations:
                return "/api/location"
            case .episodes:
                return "/api/episode"
        }
    }

    var query: [URLQueryItem]? {
        switch self {
            case .characters:
                return nil
            case .locations:
                return nil
            case .episodes:
                return nil
        }
    }
}
