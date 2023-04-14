//
//  ListEpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 22/02/23.
//

import Foundation
import RxSwift
import UIKit

class ListEpisodesViewModel {

    // MARK: - Properties
    weak var coordinator: AppCoordinator?
    private let service: RMService

    // MARK: - Init
    init(
        service: RMService = .live(),
        coordinator: AppCoordinator
    ) {
        self.service = service
        self.coordinator = coordinator
    }
}
