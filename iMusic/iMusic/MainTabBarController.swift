//
//  MainTabBarController.swift
//  iMusic
//
//  Created by Karen Vardanian on 21.10.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    let searchVC: SearchViewController = SearchViewController.loadFromStoryboard()
    let libraryVC  = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationVCSearch = generateViewController(rootViewController: searchVC, image: "magnifyingglass", title: "Search")
        let navigationVCLibrary = generateViewController(rootViewController: libraryVC, image: "building.columns", title: "Library")
 
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 1, green: 0.1719063818, blue: 0.4505617619, alpha: 1)
    
        viewControllers = [navigationVCSearch,navigationVCLibrary]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: String, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
 
        
        navigationVC.tabBarItem.image = UIImage(systemName: image)
        navigationVC.tabBarItem.title = title
        searchVC.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        
        return navigationVC
    }
    



}
