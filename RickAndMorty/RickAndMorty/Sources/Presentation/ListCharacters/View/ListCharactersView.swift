//
//  ListCharactersView.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import Kingfisher
import TinyConstraints
import UIKit

class ListCharactersView: RMView {

    // MARK: - Properties
    private var characters = [CharacterResponse]()

    // MARK: - Views
    private lazy var tableView = UITableView() .. {
        $0.delegate = self
        $0.dataSource = self
        $0.register(ListCharacterCell.self, forCellReuseIdentifier: ListCharacterCell.identifier)
        $0.separatorStyle = .none
    }

    // MARK: - Init
    override init() {
        super.init()
    }

    // MARK: - Setup
    override func configureSubviews() {
        tableView.backgroundColor = AppColors.darkGreen
        addSubview(tableView)
    }

    override func configureConstraints() {
        tableView.edgesToSuperview(usingSafeArea: true)
    }

    // MARK: - Aux
    func receive(_ characters: [CharacterResponse]) {
        self.characters = characters
        tableView.reloadData()
    }
}

extension ListCharactersView: UITableViewDelegate {}

extension ListCharactersView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCharacterCell.identifier, for: indexPath) as! ListCharacterCell
        let character = characters[indexPath.row]
        cell.setup(character)
        cell.selectionStyle = .none
        return cell
    }
}
