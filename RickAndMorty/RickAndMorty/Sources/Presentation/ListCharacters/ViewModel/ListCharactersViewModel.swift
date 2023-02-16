//
//  ListCharactersViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import RxSwift
import UIKit

class ListCharactersViewModel {

    // MARK: - Properties
    private weak var coordinator: ListCharactersCoordinator?
    private let service: RMService

    // MARK: - Init
    init(
        service: RMService = .live(),
        coordinator: ListCharactersCoordinator
    ) {
        self.service = service
        self.coordinator = coordinator
    }

    func fetchCharacters(_ url: URL, _ page: Int, _ query: String) -> Observable<CharactersResponse> {
        service
            .characters(url, page, query)
            .do(
                onNext: { [weak self] (_: CharactersResponse) in
                }
            )
    }
}
