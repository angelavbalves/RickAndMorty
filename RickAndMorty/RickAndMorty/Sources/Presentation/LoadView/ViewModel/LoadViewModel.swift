//
//  LoadViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 07/02/23.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class LoadViewModel {

    private let service: RMService
    weak var coordinator: LoadCoordinator?
    private let disposeBag = DisposeBag()
    var endpoints: AppEndpoints?

    init(
        service: RMService = .live(),
        coordinator: LoadCoordinator
    ) {
        self.service = service
        self.coordinator = coordinator
    }

    func fetchURLs() -> Observable<Void> {
        guard let url = URL(string: "https://rickandmortyapi.com/api") else {
            return .error(Errors.invalidURL)
        }
        return service
            .appURLs(url)
            .do(
                onNext: { [weak self] (appEndpoints: AppEndpoints) in
                    ApiClient.setURLs(appEndpoints)
                    DispatchQueue.main.async {
                        self?.coordinator?.showListCharacters()
                    }
                }
            )
            .map { _ in }
    }
    
}


