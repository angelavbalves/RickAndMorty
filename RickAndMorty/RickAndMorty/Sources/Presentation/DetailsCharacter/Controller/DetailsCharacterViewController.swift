//
//  DetailsCharacterViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 27/02/23.
//

import Foundation
import UIKit
import RxSwift

class DetailsCharacterViewController: UIViewController {

    private let viewModel: DetailsCharacterViewModel
    private let disposeBag = DisposeBag()

    private lazy var characterView = DetailsCharacterView(character: viewModel.character)

    // MARK: - Init
    init(viewModel: DetailsCharacterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = characterView
    }
}
