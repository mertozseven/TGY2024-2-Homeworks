//
//  ViewController.swift
//  CustomTabBar
//
//  Created by Mert Ozseven on 30.03.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Private Variables
    private var label: UILabel = {
        let label = UILabel()
        label.text = "HomeViewController"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
    }
    
    // MARK: - Private Functions

}

