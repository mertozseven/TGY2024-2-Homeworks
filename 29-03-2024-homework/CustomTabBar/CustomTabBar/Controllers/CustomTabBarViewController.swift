//
//  CustomTabBarViewController.swift
//  CustomTabBar
//
//  Created by Mert Ozseven on 30.03.2024.
//

import UIKit

class CustomTabBarViewController: UITabBarController {
    
    let btnMiddle : UIButton = {
       let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        btn.setTitle("", for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 32
        btn.setBackgroundImage(UIImage(systemName: "plus.circle.fill")?.withTintColor(UIColor(hex: "#185D91", alpha: 1.0)!, renderingMode: .alwaysOriginal), for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addTabItems()
        btnMiddle.frame = CGRect(x: Int(tabBar.bounds.width) / 2 - 30, y: Int(view.bounds.height) - 104, width: 60, height: 60)
        view.insertSubview(btnMiddle, aboveSubview: tabBar)
    }
    
    override func loadView() {
        super.loadView()
        
        tabBar.tintColor = UIColor(hex: "#185D91", alpha: 1.0)
    }
    
    private func addTabItems() {
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: ServicesViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        
        
        vc1.title = "Vitrin"
        vc2.title = "Arama"
        vc3.title = "Servisler"
        vc4.title = "Bana Özel"
        
        vc1.tabBarItem.image = UIImage(systemName: "sparkles")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "return")
        vc4.tabBarItem.image = UIImage(systemName: "person.fill")
        
        tabBar.backgroundColor = .white
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        
    }
    
}

extension UIColor {
    public convenience init?(hex: String, alpha: Double = 1.0) {
        var pureString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (pureString.hasPrefix("#")) {
            pureString.remove(at: pureString.startIndex)
        }
        if ((pureString.count) != 6) {
            return nil
        }
        let scanner = Scanner(string: pureString)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            self.init(
                red: CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(hexNumber & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0))
            return
        }
        return nil
    }
}
