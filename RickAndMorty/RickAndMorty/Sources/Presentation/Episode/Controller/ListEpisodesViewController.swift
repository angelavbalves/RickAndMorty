//
//  ListEpisodesViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 22/02/23.
//

import Foundation
import RxSwift
import TinyConstraints
import UIKit

class ListEpisodesViewController: RMViewController {

    // MARK: - Properties
    private let viewModel: ListEpisodesViewModel
    private var episodes = [EpisodesResponse]()
    private lazy var rootView = ListEpisodesView()
    private var currentPage = 1
    private let disposeBag = DisposeBag()

    // MARK: - Init
    init(viewModel: ListEpisodesViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Life Cycle
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episódios"
        fetchEpisodes()
        configureCloseButton()
        configureAppearance(AppColors.purple)
    }

    func fetchEpisodes() {
        viewModel
            .fetchEpisodes()
            .subscribe { [weak self] response in
                DispatchQueue.main.async {
                    self?.rootView.receive(response.results)
                }
            } onError: { _ in
                print("[ERROR: Erro ao buscar episódios]")
            }
            .disposed(by: disposeBag)
    }
}
