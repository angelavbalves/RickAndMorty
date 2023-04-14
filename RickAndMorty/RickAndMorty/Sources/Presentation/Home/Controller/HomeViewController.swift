//
//  HomeViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 07/02/23.
//

import Foundation
import RxSwift
import UIKit
import XCoordinator

class HomeViewController: RMViewController {

    // MARK: - View
    private lazy var rootView = HomeView { [weak self] in
        self?.userDidTapOnCharacterButton()
    } userDidTapInLocationButton: { [weak self] in
        self?.userDidTapOnLocationButton()
    } userDidTapInEpisodesButton: { [weak self] in
        self?.userDidTapOnEpisodesButton()
    }

    // MARK: - Properties
    private let router: WeakRouter<AppRoutes>

    // MARK: - Init
    init(router: WeakRouter<AppRoutes>) {
        self.router = router
        super.init()
    }

    // MARK: - Life Cycle
    override func loadView() {
        view = rootView
    }

    // MARK: - Routes
    func userDidTapOnCharacterButton() {
        router.trigger(.characters)
    }

    func userDidTapOnLocationButton() {
        router.trigger(.locations)
    }

    func userDidTapOnEpisodesButton() {
        router.trigger(.episodes)
    }
}
