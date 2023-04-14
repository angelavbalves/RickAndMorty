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
    var characters: (_ endpoint: RickAndMortyEndpoints) -> Observable<CharactersResponse>
    var episodes: (_ endpoint: RickAndMortyEndpoints) -> Observable<EpisodesResponse>
    var locations: (_ endpoint: RickAndMortyEndpoints) -> Observable<LocationsResponse>
}

extension RMService {
    static func live(_ apiClient: ApiClientProtocol = RMClient()) -> Self {
        .init { endpoint in
            apiClient
                .makeRequest(
                    endpoint: endpoint
                )
        } episodes: { endpoint in
            apiClient
                .makeRequest(
                    endpoint: endpoint
                )
        } locations: { endpoint in
            apiClient
                .makeRequest(
                    endpoint: endpoint
                )
        }
    }
}
