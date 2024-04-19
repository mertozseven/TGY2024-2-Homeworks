//
//  SearchCell.swift
//  Bipp
//
//  Created by Mert Ozseven on 19.04.2024.
//

import UIKit

class SearchCell: UITableViewCell {
    
    // MARK: - Cell Identifier
    static let identifier = "SearchCell"

    // MARK: - UI Components
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.barTintColor = .componentBackground
        searchBar.searchTextField.backgroundColor = .customSystemBackground
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        return searchBar
    }()
    
    private lazy var sortButton: UIImageView = {
        let imageView = UIImageView()
        imageView.image = resizeImage(image: UIImage(named: "sort")!,
                                      targetSize: CGSize(width: 18, height: 18))!.withTintColor(.accent)
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 16
        imageView.backgroundColor = .componentBackground
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: - inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configureViews()
        sortButtonTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addViews() {
        contentView.addSubview(searchBar)
        contentView.addSubview(sortButton)
    }
    
    private func configureViews() {
        let searchBarConstraints = [
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 56),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: sortButton.leadingAnchor, constant: -8)
        ]
        
        let sortButtonConstraints = [
            sortButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            sortButton.heightAnchor.constraint(equalToConstant: 32),
            sortButton.widthAnchor.constraint(equalToConstant: 32),
            sortButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(searchBarConstraints)
        NSLayoutConstraint.activate(sortButtonConstraints)
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let newImage = renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        
        return newImage
    }
    
    private func sortButtonTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(sortButtonAction))
        sortButton.addGestureRecognizer(tap)
    }
    
    // MARK: - Objective Functions
    @objc private func sortButtonAction() {
        print("tapped")
        if sortButton.backgroundColor == .accent {
            sortButton.backgroundColor = .componentBackground
            let newImage = sortButton.image?.withTintColor(.accent)
            sortButton.image = newImage
        } else {
            sortButton.backgroundColor = .accent
            let newImage = sortButton.image?.withTintColor(.white)
            sortButton.image = newImage
        }
    }
    
}
