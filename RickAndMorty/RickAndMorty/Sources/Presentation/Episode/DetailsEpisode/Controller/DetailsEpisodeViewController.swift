//
//  DetailsEpisodeViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 16/04/23.
//

import RxSwift
import UIKit

final class DetailsEpisodeViewController: RMViewController {

    private lazy var rootView = DetailsEpisodeView(episode: self.episode)
    private var episode: EpisodeResponseItem
    private let viewModel: DetailsEpisodeViewModel
    private let disposeBag = DisposeBag()

    override func loadView() {
        view = rootView
    }

    // MARK: -  Init
    init(
        viewModel: DetailsEpisodeViewModel,
        episode: EpisodeResponseItem
    ) {
        self.episode = episode
        self.viewModel = viewModel
        super.init()
        fetchCharactersInTheEpisode()
        configureAppearance(AppColors.lightPurple)
    }

    func fetchCharactersInTheEpisode() {
        viewModel
            .fetchCharactersInTheEpisode(episode)
            .subscribe { [weak self] response in
                DispatchQueue.main.async {
                    self?.rootView.receive(response)
                }
            } onError: { _ in
                print("[ERROR] - Erro em buscar os personagens neste episódio")
            }.disposed(by: disposeBag)
    }
}
