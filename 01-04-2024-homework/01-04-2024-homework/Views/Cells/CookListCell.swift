//
//  CookListCell.swift
//  01-04-2024-homework
//
//  Created by Mert Ozseven on 3.04.2024.
//

import UIKit
import SnapKit

class CookListCell: UITableViewCell {
    
    // MARK: - Static constants
    static let identifier = "CookListCell"
    
    // MARK: - Private Variables
    private var cookLabel: UILabel = {
        let label = UILabel()
        label.text = "deneme"
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .natural
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private var cookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(systemName: "frying.pan")
        return imageView
    }()

    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func configure(with image: UIImage, and label: String) {
        cookImageView.image = image
        cookLabel.text = label
    }
    
    // MARK: - Private Methods
    private func addViews() {
        contentView.addSubview(cookLabel)
        contentView.addSubview(cookImageView)
    }
    
    private func setupUI() {
        
        cookImageView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview().inset(8)
            $0.width.equalTo(170)
        }
        
        cookLabel.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview().inset(8)
            $0.leading.equalTo(cookImageView.snp.trailing).offset(16)
        }
        
    }
    
}


