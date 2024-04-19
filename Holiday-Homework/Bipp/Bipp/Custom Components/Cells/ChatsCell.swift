//
//  ChatsCell.swift
//  Bipp
//
//  Created by Mert Ozseven on 19.04.2024.
//

import UIKit

class ChatsCell: UITableViewCell {

    // MARK: - Cell Identifier
    static let identifier = "ChatsCell"

    // MARK: - UI Components
    private lazy var chatImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "turkcell")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var chatTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "GYGY 3.0 - Swift (2)"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var chatPreviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Kerim Çağlar: Dükkanı açtım, beklerim 🙏"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var chatTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "18:31"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    // MARK: - Private Methods
    private func addViews() {
        contentView.addSubview(chatImageView)
        contentView.addSubview(chatTitleLabel)
        contentView.addSubview(chatPreviewLabel)
        contentView.addSubview(chatTimeLabel)
    }
    
    private func configureViews() {
        let chatImageViewConstraints = [
            chatImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            chatImageView.heightAnchor.constraint(equalToConstant: 50),
            chatImageView.widthAnchor.constraint(equalToConstant: 50),
            chatImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        let chatTitleLabelConstraints = [
            chatTitleLabel.topAnchor.constraint(equalTo: chatImageView.topAnchor, constant: 4),
            chatTitleLabel.leadingAnchor.constraint(equalTo: chatImageView.trailingAnchor, constant: 10),
            chatTitleLabel.heightAnchor.constraint(equalToConstant: 18),
            chatTitleLabel.trailingAnchor.constraint(equalTo: chatTimeLabel.leadingAnchor, constant: -8)
        ]
        let chatPreviewLabelConstraints = [
            chatPreviewLabel.bottomAnchor.constraint(equalTo: chatImageView.bottomAnchor, constant: -4),
            chatPreviewLabel.leadingAnchor.constraint(equalTo: chatImageView.trailingAnchor, constant: 10),
            chatPreviewLabel.heightAnchor.constraint(equalToConstant: 14),
            chatPreviewLabel.trailingAnchor.constraint(equalTo: chatTimeLabel.trailingAnchor)
        ]
        let chatTimeLabelConstraints = [
            chatTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            chatTimeLabel.centerYAnchor.constraint(equalTo: chatTitleLabel.centerYAnchor),
            chatTimeLabel.heightAnchor.constraint(equalToConstant: 12),
            chatTimeLabel.widthAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(chatImageViewConstraints)
        NSLayoutConstraint.activate(chatTitleLabelConstraints)
        NSLayoutConstraint.activate(chatPreviewLabelConstraints)
        NSLayoutConstraint.activate(chatTimeLabelConstraints)
    }
}
