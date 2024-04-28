//
//  MyRoutesCell.swift
//  iTicket
//
//  Created by Mert Ozseven on 28.04.2024.
//

import UIKit

class MyRoutesCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "MyRoutesCell"
    
    // MARK: - UI Components
    private let nameLabel = ITLabel(
        text: "name",
        textAlignment: .center,
        textColor: .label,
        font: .systemFont(ofSize: 16, weight: .semibold)
    )
    
    // MARK: - inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
