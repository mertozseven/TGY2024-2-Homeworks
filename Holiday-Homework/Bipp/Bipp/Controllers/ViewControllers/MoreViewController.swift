//
//  MoreViewController.swift
//  Bipp
//
//  Created by Mert Ozseven on 18.04.2024.
//

import UIKit

class MoreViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private Methods
    private func configureUI() {
        title = "More"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customTitleColor]
        navigationController?.view.backgroundColor = .componentBackground
        view.backgroundColor = .customSystemBackground
        navigationController?.navigationBar.isTranslucent = false
    }

}
