//
//  EmptyView.swift
//  iTicket
//
//  Created by Mert Ozseven on 28.04.2024.
//

import UIKit

class EmptyView: UIView {
    
    // MARK: - UI Components
    private let busImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let emptyLabel = ITLabel(
        text: "Bilet bulunamadı 😔. \nLütfen Ara sayfasından bilet satın alınız.",
        textAlignment: .center,
        textColor: .label,
        font: .preferredFont(forTextStyle: .title1)
    )

    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ContainerView configuration
    private func configure() {
        layer.cornerRadius = 10
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        busImageView.image = resizeImage(image: UIImage(named: "bus")!, targetSize: CGSize(width: 128, height: 128))
    }
    
    private func addViews() {
        addSubview(busImageView)
        addSubview(emptyLabel)
    }
    
    private func configureLayout() {
        let busImageViewConstraints = [
            busImageView.heightAnchor.constraint(equalToConstant: 128),
            busImageView.widthAnchor.constraint(equalToConstant: 128),
            busImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -128),
            busImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        let emptyLabelConstraitns = [
            emptyLabel.topAnchor.constraint(equalTo: busImageView.bottomAnchor),
            emptyLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(busImageViewConstraints)
        NSLayoutConstraint.activate(emptyLabelConstraitns)
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let newImage = renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        
        return newImage
    }

}
