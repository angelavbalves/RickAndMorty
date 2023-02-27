//
//  ListEpisodesView.swift
//  RickAndMorty
//
//  Created by Angela Alves on 22/02/23.
//

import Foundation
import RxSwift
import TinyConstraints
import UIKit

class ListEpisodesView: RMView {

    // MARK: - Properties
    private var episodes = [EpisodeResponse]()

    // MARK: - View
    private lazy var tableView = UITableView() .. {
        $0.delegate = self
        $0.dataSource = self
        $0.register(ListEpisodesCell.self, forCellReuseIdentifier: ListEpisodesCell.identifier)
        $0.separatorStyle = .none
        $0.backgroundColor = AppColors.lightPurple
    }

    // MARK: - Init
    override func configureSubviews() {
        addSubview(tableView)
    }

    override func configureConstraints() {
        tableView.edgesToSuperview(usingSafeArea: true)
    }

    // MARK: - Aux
    func receive(_ episodes: [EpisodeResponse]) {
        self.episodes = episodes
        tableView.reloadData()
    }
}

extension ListEpisodesView: UITableViewDelegate {}

extension ListEpisodesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListEpisodesCell.identifier, for: indexPath) as! ListEpisodesCell
        let episode = episodes[indexPath.row]
        cell.setup(episode)
        cell.selectionStyle = .none
        return cell
    }
}
