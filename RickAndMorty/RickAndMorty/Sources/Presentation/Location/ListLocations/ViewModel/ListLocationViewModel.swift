//
//  ListLocationViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 24/02/23.
//

import Foundation
import RxSwift
import XCoordinator

final class ListLocationViewModel {

    // MARK: - Properties
    private let router: WeakRouter<LocationRoutes>
    private let service: RMService

    // MARK: - Init
    init(
        service: RMService = .live(),
        router: WeakRouter<LocationRoutes>
    ) {
        self.service = service
        self.router = router
    }

    func fetchLocations() -> Observable<LocationsResponse> {
        service
            .locations()
            .asObservable()
    }
}
