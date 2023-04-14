//
//  ListPlacesView.swift
//  RickAndMorty
//
//  Created by Angela Alves on 24/02/23.
//

import Foundation
import TinyConstraints
import UIKit

class ListPlacesView: RMView {

    // MARK: - Properties
    private var places = [LocationResponse]()

    // MARK: - View
    private lazy var tableView = UITableView() ... {
        $0.delegate = self
        $0.dataSource = self
        $0.register(ListPlacesCell.self, forCellReuseIdentifier: ListPlacesCell.identifier)
        $0.separatorStyle = .none
        $0.backgroundColor = AppColors.lightPink
    }

    // MARK: - Init
    override func configureSubviews() {
        addSubview(tableView)
    }

    override func configureConstraints() {
        tableView.edgesToSuperview(usingSafeArea: true)
    }

    // MARK: - Aux
    func receive(_ places: [LocationResponse]) {
        self.places = places
        tableView.reloadData()
    }
}

extension ListPlacesView: UITableViewDelegate {}

extension ListPlacesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListPlacesCell.identifier, for: indexPath) as! ListPlacesCell
        let place = places[indexPath.row]
        cell.setup(place)
        cell.selectionStyle = .none
        return cell
    }
}
