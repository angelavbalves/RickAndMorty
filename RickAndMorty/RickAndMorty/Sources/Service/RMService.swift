//
//  RMService.swift
//  RickAndMorty
//
//  Created by Angela Alves on 06/02/23.
//

import Foundation
import RxSwift
import UIKit

struct RMService {
    var characters: () -> Single<CharactersResponse>
    var episodes: () -> Single<EpisodesResponse>
    var locations: () -> Single<LocationsResponse>
}

extension RMService {
    static func live(_ apiClient: ApiClientProtocol = RMClient()) -> Self {
        .init {
            apiClient
                .makeRequest(
                    endpoint: RickAndMortyEndpoints.characters
                )
        } episodes: {
            apiClient
                .makeRequest(
                    endpoint: RickAndMortyEndpoints.episodes
                )
        } locations: {
            apiClient
                .makeRequest(
                    endpoint: RickAndMortyEndpoints.locations
                )
        }
    }
}
