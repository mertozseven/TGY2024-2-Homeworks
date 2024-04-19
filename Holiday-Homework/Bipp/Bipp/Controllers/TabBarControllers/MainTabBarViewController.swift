//
//  MainTabBarViewController.swift
//  Bipp
//
//  Created by Mert Ozseven on 18.04.2024.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    // MARK: - TabBar Icons
    private let statusIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "status")
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let messagesIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "messages")
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let callsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calls")
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let discoverIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "discover")
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let moreIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "more")
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    // MARK: - Private Methods
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let newImage = renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        
        return newImage
    }
    
    private func configureTabBar() {
        tabBar.backgroundColor = .componentBackground
        navigationController?.navigationBar.backgroundColor = .componentBackground
        let vc1 = UINavigationController(rootViewController: StatusViewController())
        let vc2 = UINavigationController(rootViewController: MessagesViewController())
        let vc3 = UINavigationController(rootViewController: CallsViewController())
        let vc4 = UINavigationController(rootViewController: DiscoverViewController())
        let vc5 = UINavigationController(rootViewController: MoreViewController())
        vc1.tabBarItem.image = resizeImage(image: statusIcon.image!, targetSize: CGSize(width: 30, height: 30))
        vc2.tabBarItem.image = resizeImage(image: messagesIcon.image!, targetSize: CGSize(width: 30, height: 30))
        vc3.tabBarItem.image = resizeImage(image: callsIcon.image!, targetSize: CGSize(width: 30, height: 30))
        vc4.tabBarItem.image = resizeImage(image: discoverIcon.image!, targetSize: CGSize(width: 30, height: 30))
        vc5.tabBarItem.image = resizeImage(image: moreIcon.image!, targetSize: CGSize(width: 30, height: 30))
        vc1.title = "Status"
        vc2.title = "Messages"
        vc3.title = "Calls"
        vc4.title = "Discover"
        vc5.title = "More"
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        selectedIndex = 1
    }
    
}
