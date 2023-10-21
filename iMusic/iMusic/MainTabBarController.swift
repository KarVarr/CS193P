//
//  MainTabBarController.swift
//  iMusic
//
//  Created by Karen Vardanian on 21.10.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    let searchVC = SearchViewController()
    let libraryVC  = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        viewControllers = [searchVC,libraryVC]
    }
    



}
