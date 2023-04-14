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
    private var episodes = [EpisodeResponse]()
    private lazy var listEpisodesView = ListEpisodesView()
    private var currentPage = 1
    private let disposeBag = DisposeBag()

    // MARK: - Init
    init(viewModel: ListEpisodesViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Life Cycle
    override func loadView() {
        view = listEpisodesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEpisodes(currentPage, "")
    }

    private func fetchEpisodes(_ currentPage: Int, _ query: String) {
        guard let url = ApiClient.getURLs()?.episodes else { return }
        viewModel
            .fetchEpisodes(url, currentPage, query)
            .subscribe(onNext: { [weak self] episodesResponse in
                let episodes = episodesResponse.results.map(EpisodeResponse.init)
                self?.episodes = episodes
                DispatchQueue.main.async { [weak self] in
                    self?.listEpisodesView.receive(episodes)
                }

            })
            .disposed(by: disposeBag)
    }
}