//
//  ListCharactersViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 27/12/22.
//

import RxSwift
import UIKit

class ListCharactersViewController: RMViewController {

    // MARK: - Properties
    private let viewModel: ListCharactersViewModel
    private let disposeBag = DisposeBag()
    private var currentPage = 1
    private var characters = [CharacterResponseItem]()

    // MARK: - View
    private lazy var rootView = ListCharactersView { [weak self] in
        self?.didTapOnCharacter($0)
    }

    // MARK: -  Init
    init(viewModel: ListCharactersViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Life Cycle
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        fetchCharacters()
        configureCloseButton()
    }

    private func fetchCharacters() {
        viewModel
            .fetchCharacters()
            .subscribe { [weak self] response in
                DispatchQueue.main.async {
                    self?.rootView.receive(response.results)
                }
            } onError: { _ in
                print("[ERROR] - Erro em buscar os personagens")
            }.disposed(by: disposeBag)
    }

    private func didTapOnCharacter(_ character: CharacterResponseItem) {
        viewModel.didTapOnCharacter(character)
    }
}
