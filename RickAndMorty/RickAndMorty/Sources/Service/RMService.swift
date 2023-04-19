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
    var getCharacters: () -> Single<CharactersResponse>
    var getEpisodes: () -> Single<EpisodesResponse>
    var getLocations: () -> Single<LocationsResponse>
    var getCharactersFromUrls: (_ urls: [URL]) -> Single<[CharacterResponseItem]>
}

extension RMService {
    static func live(_ apiClient: ApiClientProtocol = RMClient()) -> Self {
        .init {
            apiClient
                .makeRequest(
                    endpoint: RickAndMortyEndpoints.characters
                )
        } getEpisodes: {
            apiClient
                .makeRequest(
                    endpoint: RickAndMortyEndpoints.episodes
                )
        } getLocations: {
            apiClient
                .makeRequest(
                    endpoint: RickAndMortyEndpoints.locations
                )
        } getCharactersFromUrls: { urls -> Single<[CharacterResponseItem]> in
            Observable
                .just(urls)
                .compactMap { url -> Observable<[CharacterResponseItem]> in

                    let characters = url.map { url -> Observable<CharacterResponseItem> in
                        apiClient
                            .makeRequestWith(url: url)
                            .asObservable()
                    }

                    let combinedCharacters = Observable.combineLatest(characters)

                    return combinedCharacters
                }
                .flatMap { $0 }
                .asSingle()
        }
    }
}
