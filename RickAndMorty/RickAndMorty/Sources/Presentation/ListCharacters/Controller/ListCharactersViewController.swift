//
//  ListCharactersViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 27/12/22.
//

import UIKit

class ListCharactersViewController: RMViewController {

    // MARK: - Properties
    private let viewModel: ListCharactersViewModel

    // MARK: - View
    private lazy var listCharactersView = ListCharactersView()

    // MARK: -  Init
    init(viewModel: ListCharactersViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Life Cycle
    override func loadView() {
        view = listCharactersView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
