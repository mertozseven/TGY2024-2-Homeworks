//
//  ViewController.swift
//  Bipp
//
//  Created by Mert Ozseven on 18.04.2024.
//

import UIKit

class StatusViewController: UIViewController {
    
    // MARK: - UI Components
    private lazy var privacyButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Privacy"
        
        return button
    }()
    
    private lazy var myStatusView: MyStatusView = {
        let view = MyStatusView()
        view.backgroundColor = .componentBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var updatesLabel: UILabel = {
       let label = UILabel()
        label.text = """
                     No recent updates to show right now.
                     You can share photos and videos that will disappear 
                     after 24 hours.
                     """
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.backgroundColor = .componentBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configureViews()
        configureUI()
    }
    
    // MARK: - Private Methods
    private func addViews() {
        view.addSubview(myStatusView)
        view.addSubview(updatesLabel)
    }
    
    private func configureViews() {
        let myStatusViewConstraints = [
            myStatusView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myStatusView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myStatusView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            myStatusView.heightAnchor.constraint(equalToConstant: 102)
        ]
        
        let updatesLabelConstraints = [
            updatesLabel.topAnchor.constraint(equalTo: myStatusView.bottomAnchor, constant: 38),
            updatesLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            updatesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updatesLabel.heightAnchor.constraint(equalToConstant: 68)
        ]
        
        NSLayoutConstraint.activate(myStatusViewConstraints)
        NSLayoutConstraint.activate(updatesLabelConstraints)
    }
    
    private func configureUI() {
        title = "Status"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customTitleColor]
        navigationController?.view.backgroundColor = .componentBackground
        view.backgroundColor = .customSystemBackground
        navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = privacyButton
    }
    
}
