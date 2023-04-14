//
//  CoordinatorProtocol.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import RxSwift
import UIKit

protocol CoordinatorProtocol {
    var navController: RMNavigationController? { get }
    var childCoordinator: [CoordinatorProtocol] { get set }
    func start()
}
