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
        title = "Rick & Morty"
    }

    func configureCloseButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(didTapOnCloseButton)
        )
    }

    @objc
    func didTapOnCloseButton() {
        navigationController?.dismiss(animated: true)
    }
}
