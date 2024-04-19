//
//  MyStatusCell.swift
//  Bipp
//
//  Created by Mert Ozseven on 18.04.2024.
//

import UIKit

class MyStatusCell: UITableViewCell {
    
    // MARK: - Cell Identifier
    static let identifier = "MyStatusCell"
    
    // MARK: - UI Components
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profilePhoto")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var plusButton: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus.circle.fill")?.withTintColor(.accent)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 11
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var myStatusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "My Status"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var addToStatusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.text = "Add to my status"
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var penIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = resizeImage(image: (UIImage(named: "pen")?.withTintColor(.accent))!,
                                      targetSize: CGSize(width: 20, height: 20))
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 22
        imageView.clipsToBounds = true
        imageView.backgroundColor = .customSystemBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var cameraIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = resizeImage(image: (UIImage(named: "camera")?.withTintColor(.accent))!,
                                      targetSize: CGSize(width: 22, height: 22))
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 22
        imageView.clipsToBounds = true
        imageView.backgroundColor = .customSystemBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
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
        contentView.addSubview(profileImageView)
        contentView.addSubview(plusButton)
        contentView.addSubview(myStatusLabel)
        contentView.addSubview(addToStatusLabel)
        contentView.addSubview(penIcon)
        contentView.addSubview(cameraIcon)
    }
    
    private func configureViews() {
        let profileImageViewConstraints = [
            profileImageView.heightAnchor.constraint(equalToConstant: 60),
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18)
        ]
        let plusButtonConstraints = [
            plusButton.heightAnchor.constraint(equalToConstant: 22),
            plusButton.widthAnchor.constraint(equalToConstant: 22),
            plusButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor)
        ]
        let myStatusLabelConstraints = [
            myStatusLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            myStatusLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -1),
            myStatusLabel.widthAnchor.constraint(equalToConstant: 104),
            myStatusLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        let addToStatusLabelConstraints = [
            addToStatusLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 6),
            addToStatusLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            addToStatusLabel.heightAnchor.constraint(equalToConstant: 15),
            addToStatusLabel.widthAnchor.constraint(equalToConstant: 128)
        ]
        let penIconConstraints = [
            penIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            penIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            penIcon.heightAnchor.constraint(equalToConstant: 44),
            penIcon.widthAnchor.constraint(equalToConstant: 44)
        ]
        let cameraIconConstraints = [
            cameraIcon.trailingAnchor.constraint(equalTo: penIcon.leadingAnchor, constant: -16),
            cameraIcon.heightAnchor.constraint(equalToConstant: 44),
            cameraIcon.widthAnchor.constraint(equalToConstant: 44),
            cameraIcon.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(profileImageViewConstraints)
        NSLayoutConstraint.activate(myStatusLabelConstraints)
        NSLayoutConstraint.activate(addToStatusLabelConstraints)
        NSLayoutConstraint.activate(penIconConstraints)
        NSLayoutConstraint.activate(cameraIconConstraints)
        NSLayoutConstraint.activate(plusButtonConstraints)
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let newImage = renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        
        return newImage
    }
    
}
