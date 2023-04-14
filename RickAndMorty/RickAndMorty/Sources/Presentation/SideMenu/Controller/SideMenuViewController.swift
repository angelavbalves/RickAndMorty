//
//  SideMenuViewController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import UIKit

class SideMenuViewController: RMViewController {

//     MARK: - View
    private lazy var sideMenuView = SideMenuView()

//     MARK: - Life Cycle
    override func loadView() {
        view = sideMenuView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

