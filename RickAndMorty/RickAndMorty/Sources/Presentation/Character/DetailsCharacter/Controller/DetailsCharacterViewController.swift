//
//  DetailsCharacterViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 27/02/23.
//

import Foundation
import UIKit
import RxSwift

class DetailsCharacterViewController: RMViewController {

    private var character: CharacterResponseItem
    private lazy var characterView = DetailsCharacterView(character: character)

    // MARK: - Init
    init(character: CharacterResponseItem) {
        self.character = character
        super.init()
    }

    override func loadView() {
        view = characterView
    }
}
