//
//  RMViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import RxSwift
import TinyConstraints
import UIKit

class RMViewController: UIViewController {

    // MARK: - Properties
    private lazy var barButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "text.justify"),
        style: .done,
        target: self,
        action: #selector(menuBarButtonItemTapped)
    )
    private var rmNavigationController: RMNavigationController? {
        navigationController as? RMNavigationController
    }

    var isSlideMenuPresented = false
    private var sideMenuController: UIViewController?
    private lazy var sideMenuRightOffset: CGFloat = self.view.frame.width * 0.30
    private lazy var menuViewRightConstraint: NSLayoutConstraint = menuView.right(to: view, offset: -view.frame.width)
    let menuView = SideMenuView()

    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = barButtonItem
        title = "Rick & Morty"
        configureHomeController()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        menuView.frame.origin.x = -(menuView.frame.width)
        configureMenuView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        menuView.frame.origin.x = -(menuView.frame.width)
    }

    private func configureMenuView() {
        view.addSubview(menuView)
        menuView.leftToSuperview()
        menuView.topToSuperview()
        menuView.bottomToSuperview()
        menuView.right(to: view, offset: -(view.frame.width * 0.3))
    }

    @objc
    func menuBarButtonItemTapped() {
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

    func configureHomeController() {}

    func configureMenuControllerIfNeeded() {
        guard sideMenuController == nil else { return }
        sideMenuController = SideMenuViewController()
        guard let sideMenuController = sideMenuController else { return }
        addChild(sideMenuController)
        sideMenuController.didMove(toParent: self)
    }
}
