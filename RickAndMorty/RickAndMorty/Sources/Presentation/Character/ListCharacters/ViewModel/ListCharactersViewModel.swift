//
//  ListCharactersViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import RxSwift
import UIKit
import XCoordinator

class ListCharactersViewModel {

    // MARK: - Properties
    private let service: RMService
    private let router: WeakRouter<CharacterRoutes>

    // MARK: - Init
    init(
        router: WeakRouter<CharacterRoutes>,
        service: RMService = .live()
    ) {
        self.router = router
        self.service = service
    }

    func fetchCharacters() -> Observable<CharactersResponse> {
        service
            .characters(RickAndMortyEndpoints.characters)
    }

    func didTapOnCharacter(_ character: CharacterResponseItem) {
        router.trigger(.details(character))
    }
}