//
//  SideMenuViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import UIKit

class SideMenuViewController: RMViewController {

    // MARK: - View
    private lazy var sideMenuView = SideMenuView(
         didTapOnCharactersList: { [weak self] in
            self?.showCharacterList()
        },
         didTapOnEpisodesList: { [weak self] in
            self?.showEpisodesList()
         }, didTapOnPlacesList: { [weak self] in
             self?.showPlacesList()
         }
    )
     private let viewModel: SideMenuViewModel

    // MARK: - Init
    init(viewModel: SideMenuViewModel
    ) {
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Life Cycle
    override func loadView() {
        view = sideMenuView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func showCharacterList() {
        viewModel.showCharacterList()
    }

    private func showEpisodesList() {
        viewModel.showEpisodesList()
    }

    private func showPlacesList() {
        viewModel.showPlacesList()
    }
}

