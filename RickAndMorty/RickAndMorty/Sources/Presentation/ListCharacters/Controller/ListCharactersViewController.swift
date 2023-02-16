//
//  ListCharactersViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 27/12/22.
//

import UIKit
import RxSwift

class ListCharactersViewController: RMViewController {

    // MARK: - Properties
    private let viewModel: ListCharactersViewModel
    private let rmClient = RMClient()
    private var urls: Observable<AppEndpoints>?
    private let disposeBag = DisposeBag()
    private var currentPage = 1

    // MARK: - View
    private lazy var listCharactersView = ListCharactersView()

    // MARK: -  Init
    init(viewModel: ListCharactersViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Life Cycle
    override func loadView() {
        view = listCharactersView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacters(currentPage, "")
    }

    private func fetchCharacters(_ currentPage: Int, _ query: String) {
        guard let url = ApiClient.getURLs()?.characters else { return }
        viewModel
            .fetchCharacters(url, currentPage, query)
            .subscribe(onNext: { charactersResponse in
                let characters = charactersResponse.results.map(CharacterResponse.init)
            })
            .disposed(by: disposeBag)
    }
}
