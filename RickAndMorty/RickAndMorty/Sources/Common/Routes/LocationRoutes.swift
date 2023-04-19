//
//  LocationRoutes.swift
//  RickAndMorty
//
//  Created by Angela Alves on 16/04/23.
//

import Foundation
import XCoordinator

enum LocationRoutes: Route {
    case list
    case details(LocationResponseItem)
}
