//
//  SegmentedControlCell.swift
//  Bipp
//
//  Created by Mert Ozseven on 18.04.2024.
//

import UIKit

class SegmentedControlCell: UITableViewCell {
    
    // MARK: - Cell Identifier
    static let identifier = "SegmentedControlCell"
    
    // MARK: - Private Variables
    private var segmentedControlItems = ["Chats", "Services"]
    
    // MARK: - UI Components
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: segmentedControlItems)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = .accent
        segmentedControl.selectedSegmentTintColor = .accent
        segmentedControl.backgroundColor = .componentBackground
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.accent], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentedControl
    }()

    // MARK: - inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func configureSegmentedControlItems(with items: [String]) {
        self.segmentedControlItems = items
    }
    
    // MARK: - Private Methods
    private func addViews() {
        contentView.addSubview(segmentedControl)
    }
    
    private func configureViews() {
        let segmentedControlConstraints = [
            segmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmentedControl.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.55),
            segmentedControl.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            segmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ]
        
        NSLayoutConstraint.activate(segmentedControlConstraints)
    }

}
