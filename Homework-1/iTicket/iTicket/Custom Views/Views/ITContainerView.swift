//
//  ITContainerView.swift
//  iTicket
//
//  Created by Mert Ozseven on 23.04.2024.
//

import UIKit

class ITContainerView: UIView {
    
    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ContainerView configuration
    private func configure() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
