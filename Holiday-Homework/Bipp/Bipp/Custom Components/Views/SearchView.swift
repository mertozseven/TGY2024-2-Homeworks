//
//  SearchView.swift
//  Bipp
//
//  Created by Mert Ozseven on 19.04.2024.
//

import UIKit

class SearchView: UIView {
    
    // MARK: - UI Components
    private lazy var searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .componentBackground
        tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureViews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addViews() {
        addSubview(searchTableView)
    }
    
    private func configureViews() {
        let searchTableViewConstraints = [
            searchTableView.topAnchor.constraint(equalTo: topAnchor),
            searchTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            searchTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(searchTableViewConstraints)
    }
    
    private func configureUI() {
        backgroundColor = .componentBackground
        
    }
    
}

// MARK: - Table View Delegate Extension
extension SearchView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        56
    }
    
}

// MARK: - Table View Data Source Extension
extension SearchView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifier, for: indexPath) as? SearchCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
}
