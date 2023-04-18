//
//  DetailsEpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 16/04/23.
//

import RxSwift
import UIKit
import XCoordinator

final class DetailsEpisodeViewModel {

    // MARK: - Properties
    private let service: RMService
    private let router: WeakRouter<EpisodeRoutes>

    // MARK: - Init
    init(
        router: WeakRouter<EpisodeRoutes>,
        service: RMService = .live()
    ) {
        self.router = router
        self.service = service
    }

    func fetchCharactersInTheEpisode(_ episode: EpisodeResponseItem) -> Observable<[CharacterResponseItem]> {
        let charactersUrls = episode.characters
        return service
            .getCharactersFromUrls(charactersUrls)
            .asObservable()
    }
}
