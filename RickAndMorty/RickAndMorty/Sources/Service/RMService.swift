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
    var appURLs: (_ url: URL) -> Observable<AppEndpoints>
    var characters: (_ url: URL, _ page: Int, _ query: String) -> Observable<CharactersResponse>
    var episodes: (_ url: URL, _ page: Int, _ query: String) -> Observable<EpisodesResponse>
    var locations: (_ url: URL, _ page: Int, _ query: String) -> Observable<LocationsResponse>
}

extension RMService {
    static func live(_ apiClient: ApiClientProtocol = RMClient()) -> Self {
        .init { url in
            apiClient.makeRequest(url: url)
        } characters: { url, _, _ in
            apiClient.makeRequest(url: url)
        } episodes: { url, _, _ in
            apiClient.makeRequest(url: url)
        } locations: { url, _, _ in
            apiClient.makeRequest(url: url)
        }
    }
}
