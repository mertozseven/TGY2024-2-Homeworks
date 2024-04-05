//
//  FirebaseCell.swift
//  03-04-2024-homework
//
//  Created by Mert Ozseven on 5.04.2024.
//

import UIKit

class FirebaseCell: UITableViewCell {
    
    static let identifier = "FirebaseCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "deneme"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        contentView.addSubview(label)
    }
    
    private func configureUI() {
        label.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview().inset(16)
//            $0.trailing.bottom.equalToSuperview().inset(8)
        }
    }
    
    public func configure(with name: String) {
        label.text = name
    }
    
}
