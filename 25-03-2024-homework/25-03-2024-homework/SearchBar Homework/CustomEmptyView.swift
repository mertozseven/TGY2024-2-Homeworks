//
//  CustomEmptyView.swift
//  25-03-2024-homework
//
//  Created by Mert Ozseven on 27.03.2024.
//

import UIKit

class CustomEmptyView: UIView {
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "The user you entered could not found 😔"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMessage(_ message: String) {
        messageLabel.text = message
    }
}

