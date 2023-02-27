//
//  ListPlacesViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 24/02/23.
//

import Foundation
import UIKit
import RxSwift

class ListPlacesViewController: RMViewController {

    // MARK: - Properties
    private let viewModel: ListPlacesViewModel
    private var places = [LocationResponse]()
    private let disposeBag = DisposeBag()
    private var currentPage = 1
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
        super.viewDidLoad()
        title = "Places"
        view.backgroundColor = AppColors.lightPink
        navigationItem.leftBarButtonItem = barButtonItem
        fetchPlaces(currentPage, "")
    }

    private func fetchPlaces(_ currentPage: Int, _ query: String) {
        guard let url = ApiClient.getURLs()?.locations else { return }
        viewModel
            .fetchPlaces(url, currentPage, query)
            .subscribe(onNext: { [weak self] locationsResponse in
                let places = locationsResponse.results.map(LocationResponse.init)
                self?.places = places
                DispatchQueue.main.async {
                    self?.listPlacesView.receive(places)
                }
            })
            .disposed(by: disposeBag)
    }
}
