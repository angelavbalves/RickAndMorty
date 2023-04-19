//
//  ListLocationViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 24/02/23.
//

import Foundation
import RxSwift
import UIKit

final class ListLocationViewController: RMViewController {

    // MARK: - Properties
    private let viewModel: ListLocationViewModel
    private var places = [LocationResponseItem]()
    private let disposeBag = DisposeBag()
    private var currentPage = 1

    // MARK: - View
    private let rootView = ListLocationView()

    // MARK: -  Init
    init(viewModel: ListLocationViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Life Cycle
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lugares"
        fetchLocations()
        configureCloseButton()
        configureAppearance(AppColors.pink)
    }

    // MARK: - Request
    private func fetchLocations() {
        viewModel
            .fetchLocations()
            .subscribe { [weak self] response in
                DispatchQueue.main.async {
                    self?.rootView.receive(response.results)
                }
            } onError: { _ in
                print("[ERROR] - Erro em buscar os lugares")
            }.disposed(by: disposeBag)
    }
    
}
