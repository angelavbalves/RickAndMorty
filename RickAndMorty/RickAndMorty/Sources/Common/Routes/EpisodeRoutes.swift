//
//  EpisodeRoutes.swift
//  RickAndMorty
//
//  Created by Angela Alves on 14/04/23.
//

import Foundation
import XCoordinator

enum EpisodeRoutes: Route {
    case list
    case details(LocationResponseItem)
}
