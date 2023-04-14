//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 07/02/23.
//

import Foundation
import RxSwift
import UIKit

class HomeViewModel {

    private let service: RMService
    weak var coordinator: AppCoordinator?
    private let disposeBag = DisposeBag()
    var endpoints: AppEndpoints?

    init(
        service: RMService = .live(),
        coordinator: AppCoordinator?
    ) {
        self.service = service
        self.coordinator = coordinator
    }

//    func fetchURLs() -> Observable<Void> {
//        guard let url = URL(string: "https://rickandmortyapi.com/api") else {
//            return .error(ErrorState.invalidURL)
//        }
//        return service
//            .appURLs(url)
//            .do(
//                onNext: { [weak self] (appEndpoints: AppEndpoints) in
//                    ApiClient.setURLs(appEndpoints)
//                    DispatchQueue.main.async {
//                        self?.coordinator?.showListCharacters()
//                    }
//                }
//            )
//            .map { _ in }
//    }
}
