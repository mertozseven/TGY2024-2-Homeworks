//
//  MainTabBarController.swift
//  iTicket
//
//  Created by Mert Ozseven on 22.04.2024.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Tab Bar Configuration
    private func configure() {
        let vc1 = UINavigationController(rootViewController: SearchViewController(viewModel: iTicketViewModel()))
        let vc2 = UINavigationController(rootViewController: MyRoutesViewController(viewModel: iTicketViewModel()))
        vc1.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc2.tabBarItem.image = UIImage(systemName: "arrow.triangle.swap")
        vc1.title = "Ara"
        vc2.title = "Seyahatlerim"
        setViewControllers([vc1, vc2], animated: false)
    }
    
}
