//
//  SideMenuManager.swift
//  RickAndMorty
//
//  Created by Angela Alves on 24/02/23.
//

import Foundation
import UIKit
import TinyConstraints

class SideMenuManager {

    private var rmNavigationController: RMNavigationController
    private lazy var coordinator = SideMenuCoordinator(rootViewController: rmNavigationController)
    private lazy var viewModel = SideMenuViewModel(coordinator: coordinator)
    private lazy var controller = SideMenuViewController(viewModel: viewModel)
    private var isSlideMenuPresented = false
    private lazy var sideMenuRightOffset: CGFloat = self.controller.view.frame.width * 0.30
    private lazy var menuViewRightConstraint: NSLayoutConstraint = menuView.right(to: controller.view, offset: -controller.view.frame.width)
    lazy var menuView = SideMenuView { [weak self] in
        self?.showCharacterList()
    } didTapOnEpisodesList: { [weak self] in
        self?.showEpisodesList()
    } didTapOnPlacesList: { [weak self] in
        self?.showPlacesList()
    }

    init(navController: RMNavigationController) {
        rmNavigationController = navController
    }

    func configureMenu(on viewController: RMViewController) {
        viewController.addChild(controller)
        controller.didMove(toParent: viewController)
        viewController.view.addSubview(menuView)
        menuView.leftToSuperview()
        menuView.topToSuperview()
        menuView.bottomToSuperview()
        menuView.right(to: viewController.view, offset: -(viewController.view.frame.width * 0.3))
    }

    func showSideMenu() {
        if isSlideMenuPresented {
            isSlideMenuPresented = false
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .curveEaseInOut
            ) {
                self.menuView.frame.origin.x = -(self.menuView.frame.width)
            }
        } else {
            isSlideMenuPresented = true
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .beginFromCurrentState
            ) {
                self.menuView.frame.origin.x = 0
            }
        }
    }

    func showCharacterList() {
        coordinator.showCharacterList()
    }

    func showEpisodesList() {
        coordinator.showEpisodesList()
    }

    func showPlacesList() {
        coordinator.showPlacesList()
    }
}
