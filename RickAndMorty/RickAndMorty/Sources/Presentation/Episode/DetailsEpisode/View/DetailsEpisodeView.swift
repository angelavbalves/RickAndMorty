//
//  DetailsEpisodeView.swift
//  RickAndMorty
//
//  Created by Angela Alves on 16/04/23.
//

import TinyConstraints
import UIKit

final class DetailsEpisodeView: RMView {

    // MARK: - Properties
    private var charactersInThisEpisode: [CharacterResponseItem] = []
    private var episode: EpisodeResponseItem

    // MARK: - View
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()) ... {
        $0.delegate = self
        $0.dataSource = self
        $0.register(
            DetailsEpisodeCell.self,
            forCellWithReuseIdentifier: DetailsEpisodeCell.identifier
        )
        $0.register(
            DetailsEpisodeHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: DetailsEpisodeHeader.identifier
        )
        $0.prefetchDataSource = self
        $0.backgroundColor = AppColors.lightGreen
    }

    override func configureSubviews() {
        addSubview(collectionView)
    }

    override func configureConstraints() {
        collectionView.verticalToSuperview()
        collectionView.horizontalToSuperview(usingSafeArea: true)
    }

    // MARK: - Init
    init(episode: EpisodeResponseItem) {
        self.episode = episode
        super.init()
        backgroundColor = AppColors.lightPurple
    }

    // MARK: - Populate CollectionView
    func receive(_ characters: [CharacterResponseItem]) {
        charactersInThisEpisode = characters
        collectionView.reloadData()
    }
}

extension DetailsEpisodeView: UICollectionViewDelegate {}

extension DetailsEpisodeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        charactersInThisEpisode.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsEpisodeCell.identifier, for: indexPath) as? DetailsEpisodeCell
        else {
            return UICollectionViewCell()
        }

        let character = charactersInThisEpisode[indexPath.row]
        cell.setup(character)
        return cell
    }
}

extension DetailsEpisodeView: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {}
}

extension DetailsEpisodeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard
            !charactersInThisEpisode.isEmpty
        else {
            return .init(width: collectionView.frame.width - 70, height: 100)
        }

        let width = isSmallScreen ? 100 : 140
        let height = isSmallScreen ? 140 : 200
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .uniform(Spacing.medium)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: DetailsEpisodeHeader.identifier,
                    for: indexPath
                ) as? DetailsEpisodeHeader
            else {
                return UICollectionReusableView()
            }
            header.setup(episode)
            return header
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let header = DetailsEpisodeHeader()
        header.setup(episode)
        return header.systemLayoutSizeFitting(
            CGSize(width: collectionView.frame.width,
                   height: UIView.layoutFittingExpandedSize.height),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
    }
}
