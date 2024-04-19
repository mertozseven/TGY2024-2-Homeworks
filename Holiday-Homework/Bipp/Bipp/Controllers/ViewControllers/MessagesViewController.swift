//
//  MessagesViewController.swift
//  Bipp
//
//  Created by Mert Ozseven on 18.04.2024.
//

import UIKit

class MessagesViewController: UIViewController {
    
    // MARK: - UI Components
    private lazy var editButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Edit"
        
        return button
    }()
    
    private lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "plus")
        
        return button
    }()
    
    private lazy var alarmButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "light.beacon.min.fill")
        button.tintColor = .systemRed
        
        return button
    }()
    
    private lazy var segmentedControlView: SegmentedControlView = {
        let view = SegmentedControlView()
        view.backgroundColor = .componentBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var searchView: SearchView = {
        let view = SearchView()
        view.backgroundColor = .componentBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var chatsView: ChatsView = {
        let view = ChatsView()
        view.backgroundColor = .componentBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
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
        view.addSubview(segmentedControlView)
        view.addSubview(searchView)
        view.addSubview(chatsView)
    }
    
    private func configureViews() {
        let segmentedControlViewConstraints = [
            segmentedControlView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentedControlView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControlView.widthAnchor.constraint(equalTo: view.widthAnchor),
            segmentedControlView.heightAnchor.constraint(equalToConstant: 44)
        ]
        let searchViewConstraints = [
            searchView.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 56)
        ]
        let chatsViewConstraints = [
            chatsView.topAnchor.constraint(equalTo: searchView.bottomAnchor),
            chatsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(segmentedControlViewConstraints)
        NSLayoutConstraint.activate(searchViewConstraints)
        NSLayoutConstraint.activate(chatsViewConstraints)
    }
    
    private func configureUI() {
        title = "Messages"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customTitleColor]
        navigationController?.view.backgroundColor = .componentBackground
        view.backgroundColor = .componentBackground
        navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = editButton
        self.navigationItem.rightBarButtonItems = [plusButton, alarmButton]
    }

}
