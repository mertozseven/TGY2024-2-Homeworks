//
//  ITButton.swift
//  iTicket
//
//  Created by Mert Ozseven on 22.04.2024.
//

import UIKit

class ITButton: UIButton {

    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(
        backgroundColor: UIColor,
        title: String,
        font: UIFont
    ) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        configure()
    }
    
    // MARK: - Button Configuration
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
