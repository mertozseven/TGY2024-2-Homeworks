//
//  MyStatusView.swift
//  Bipp
//
//  Created by Mert Ozseven on 19.04.2024.
//

import UIKit

class MyStatusView: UIView {
    
    // MARK: - UI Components
    private lazy var myStatusTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .componentBackground
        tableView.register(MyStatusCell.self, forCellReuseIdentifier: MyStatusCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addViews() {
        addSubview(myStatusTableView)
    }
    
    private func configureViews() {
        let myStatusTableViewConstraints = [
            myStatusTableView.topAnchor.constraint(equalTo: topAnchor),
            myStatusTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myStatusTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myStatusTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(myStatusTableViewConstraints)
    }
    
}

// MARK: - Table View Delegate Extension
extension MyStatusView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        102
    }
    
}

// MARK: - Table View Data Source Extension
extension MyStatusView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyStatusCell.identifier, for: indexPath) as? MyStatusCell else {
            return UITableViewCell()
        }
        cell.isUserInteractionEnabled = false
        cell.backgroundColor = .componentBackground
        return cell
    }
    
}
