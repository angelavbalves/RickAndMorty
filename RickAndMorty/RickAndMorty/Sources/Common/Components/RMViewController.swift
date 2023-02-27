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

    private lazy var sideMenuManager = SideMenuManager(navController: rmNavigationController ?? RMNavigationController())
    private lazy var sideMenuView = sideMenuManager.menuView

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
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sideMenuView.frame.origin.x = -(sideMenuView.frame.width)
        configureMenu()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sideMenuView.frame.origin.x = -(sideMenuView.frame.width)
    }

    private func configureMenu() {
        sideMenuManager.configureMenu(on: self)
    }

    @objc
    func menuBarButtonItemTapped() {
        sideMenuManager.showSideMenu()
    }
}
