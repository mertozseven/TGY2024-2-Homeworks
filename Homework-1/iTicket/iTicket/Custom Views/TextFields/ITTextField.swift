//
//  ITTextField.swift
//  iTicket
//
//  Created by Mert Ozseven on 23.04.2024.
//

import UIKit

class ITTextField: UITextField {
    
    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(
        placeholder: String,
        textAlignment: NSTextAlignment,
        textColor: UIColor,
        font: UIFont,
        backgroundColor: UIColor = .tertiarySystemBackground,
        cornerRadius: CGFloat = 0
    ) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        configure()
    }
    
    // MARK: - Private Methods
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        autocorrectionType = .no
        clipsToBounds = true
    }
}
