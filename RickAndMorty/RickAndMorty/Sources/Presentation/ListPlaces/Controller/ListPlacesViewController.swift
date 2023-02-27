//
//  ListPlacesViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 24/02/23.
//

import Foundation
import UIKit

class ListPlacesViewController: RMViewController {

    // MARK: - Properties
    private let viewModel: ListPlacesViewModel
    private lazy var barButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "text.justify"),
        style: .done,
        target: self,
        action: #selector(menuBarButtonItemTapped)
    )

    // MARK: - View
    private let listPlacesView = ListPlacesView()

    // MARK: -  Init
    init(viewModel: ListPlacesViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Life Cycle
    override func loadView() {
        view = listPlacesView
    }

    override func viewDidLoad() {
        view.backgroundColor = .systemPink
        navigationItem.leftBarButtonItem = barButtonItem
    }
}
