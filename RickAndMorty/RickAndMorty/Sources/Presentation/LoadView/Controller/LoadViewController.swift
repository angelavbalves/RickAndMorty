//
//  LoadViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 07/02/23.
//

import Foundation
import RxSwift
import UIKit

class LoadViewController: RMViewController {

    // MARK: - Properties
    private let viewModel: LoadViewModel
    private lazy var loadingView = LoadView()
    private let disposeBag = DisposeBag()

    // MARK: - Init
    init(viewModel: LoadViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    override func loadView() {
        view = loadingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBaseURLs()
    }

    func fetchBaseURLs() {
        viewModel
            .fetchURLs()
            .subscribe(onNext: { _ in })
            .disposed(by: disposeBag)
    }
}
