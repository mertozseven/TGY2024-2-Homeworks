//
//  CustomCell.swift
//  25-03-2024-homework
//
//  Created by Mert Ozseven on 27.03.2024.
//

import UIKit

class CustomCell: UITableViewCell {

    static let identifier = "CustomCell"
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.text = "deneme"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with label: String) {
        self.myLabel.text = label
    }
    
    private func addViews() {
        self.contentView.addSubview(myLabel)
    }
    
    private func configureView() {
        let myLabelConstraints = [
            myLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            myLabel.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor, constant: 16),
            myLabel.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor, constant: -16),
            myLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(myLabelConstraints)
    }
    
}
