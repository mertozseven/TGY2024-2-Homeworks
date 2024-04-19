//
//  SegmentedControlTableView.swift
//  Bipp
//
//  Created by Mert Ozseven on 19.04.2024.
//

import UIKit

class SegmentedControlView: UIView {
    
    // MARK: - Private Varibles
    private lazy var segmentedControlItems = ["Chats", "Services"]
    
    // MARK: - UI Components
    private lazy var segmentedControlTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .componentBackground
        tableView.register(SegmentedControlCell.self, forCellReuseIdentifier: SegmentedControlCell.identifier)
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
        addSubview(segmentedControlTableView)
    }
    
    private func configureViews() {
        let segmentedControlTableViewConstraints = [
            segmentedControlTableView.topAnchor.constraint(equalTo: topAnchor),
            segmentedControlTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            segmentedControlTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            segmentedControlTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(segmentedControlTableViewConstraints)
    }
    
}

// MARK: - Table View Delegate Extension
extension SegmentedControlView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
}

// MARK: - Table View Data Source Extension
extension SegmentedControlView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SegmentedControlCell.identifier, for: indexPath) as? SegmentedControlCell else {
            return UITableViewCell()
        }
        cell.configureSegmentedControlItems(with: segmentedControlItems)
        cell.backgroundColor = .componentBackground
        cell.selectionStyle = .none
        return cell
    }
    
}
