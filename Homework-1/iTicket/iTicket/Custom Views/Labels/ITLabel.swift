//
//  ITTitleLabel.swift
//  iTicket
//
//  Created by Mert Ozseven on 24.04.2024.
//

import UIKit

class ITLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(
        text: String,
        textAlignment: NSTextAlignment,
        textColor: UIColor,
        font: UIFont,
        backgroundColor: UIColor = .clear,
        cornerRadius: CGFloat = 0,
        isUserInteractionEnabled: Bool = false
    ) {
        super.init(frame: .zero)
        self.text = text
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.isUserInteractionEnabled = isUserInteractionEnabled
        configure()
    }
    
    private func configure() {
        clipsToBounds = true
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
