//
//  ListPlacesViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 24/02/23.
//

import Foundation
import RxSwift
import UIKit

class ListPlacesViewController: RMViewController {

    // MARK: - Properties
    private let viewModel: ListPlacesViewModel
    private var places = [LocationResponse]()
    private let disposeBag = DisposeBag()
    private var currentPage = 1

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
        super.viewDidLoad()
        title = "Places"
        view.backgroundColor = AppColors.lightPink
    }
}
