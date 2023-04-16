//
//  ListLocationView.swift
//  RickAndMorty
//
//  Created by Angela Alves on 24/02/23.
//

import Foundation
import TinyConstraints
import UIKit

class ListLocationView: RMView {

    // MARK: - Properties
    private var locations = [LocationResponseItem]()

    // MARK: - View
    private lazy var tableView = UITableView() ... {
        $0.delegate = self
        $0.dataSource = self
        $0.register(ListLocationCell.self, forCellReuseIdentifier: ListLocationCell.identifier)
        $0.separatorStyle = .none
        $0.backgroundColor = AppColors.pink
    }

    // MARK: - Init
    override func configureSubviews() {
        addSubview(tableView)
    }

    override func configureConstraints() {
        tableView.edgesToSuperview()
    }

    // MARK: - Aux
    func receive(_ locations: [LocationResponseItem]) {
        self.locations = locations
        tableView.reloadData()
    }
}

extension ListLocationView: UITableViewDelegate {}

extension ListLocationView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: ListLocationCell.identifier, for: indexPath) as? ListLocationCell
        else {
            return UITableViewCell()
        }
        let place = locations[indexPath.row]
        cell.setup(place)
        return cell
    }
}
