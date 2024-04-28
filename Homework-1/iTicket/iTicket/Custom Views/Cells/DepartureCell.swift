//
//  DepartureCell.swift
//  iTicket
//
//  Created by Mert Ozseven on 23.04.2024.
//

import UIKit

class DepartureCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "DepartureCell"
    static let prices = ["500 ₺", "600 ₺", "700 ₺", "750 ₺", "800 ₺", "450 ₺"]
    
    // MARK: - UI Components
    private var containerView = ITContainerView()
    
    private var busLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private var departureDate = ITLabel(
        text: "dd.MM.yyyy",
        textAlignment: .center,
        textColor: .label,
        font: .preferredFont(forTextStyle: .title3)
    )
    
    private var departurePrice = ITLabel(
        text: prices.randomElement() ?? "650 ₺",
        textAlignment: .center,
        textColor: .label,
        font: .preferredFont(forTextStyle: .title1)
    )
    
    private var fromLabel = ITLabel(
        text: "Nereden",
        textAlignment: .center,
        textColor: .secondaryLabel,
        font: .preferredFont(forTextStyle: .body)
    )
    
    private var toLabel = ITLabel(
        text: "Nereye",
        textAlignment: .center,
        textColor: .secondaryLabel,
        font: .preferredFont(forTextStyle: .body)
    )
    
    private var toIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.forward")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .secondaryLabel
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
    
    // MARK: - Public Methods
    public func configure(
        busLogo: UIImage,
        departureDate: String,
        fromCity: String,
        toCity: String
    ) {
        self.busLogo.image = busLogo
        self.departureDate.text = departureDate
        self.fromLabel.text = fromCity
        self.toLabel.text = toCity
    }
    
    // MARK: - Private Methods
    private func addViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(busLogo)
        containerView.addSubview(departureDate)
        containerView.addSubview(departurePrice)
        containerView.addSubview(fromLabel)
        containerView.addSubview(toIcon)
        containerView.addSubview(toLabel)
    }
    
    private func configureViews() {
        let containerViewConstraints = [
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        let busLogoConstraints = [
            busLogo.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            busLogo.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            busLogo.heightAnchor.constraint(equalToConstant: 64),
            busLogo.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.25)
        ]
        let departureDateConstraints = [
            departureDate.centerYAnchor.constraint(equalTo: busLogo.centerYAnchor),
            departureDate.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            departureDate.heightAnchor.constraint(equalToConstant: 24),
            departureDate.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.33)
        ]
        let departurePriceConstraints = [
            departurePrice.centerYAnchor.constraint(equalTo: busLogo.centerYAnchor),
            departurePrice.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            departurePrice.heightAnchor.constraint(equalToConstant: 27),
            departurePrice.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.25)
        ]
        let fromLabelConstraints = [
            fromLabel.topAnchor.constraint(equalTo: busLogo.bottomAnchor, constant: 8),
            fromLabel.trailingAnchor.constraint(equalTo: toIcon.leadingAnchor, constant: -2),
            fromLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            fromLabel.widthAnchor.constraint(equalToConstant: 128)
        ]
        let toIconConstraints = [
            toIcon.topAnchor.constraint(equalTo: busLogo.bottomAnchor, constant: 8),
            toIcon.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            toIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            toIcon.widthAnchor.constraint(equalToConstant: 16)
        ]
        let toLabelConstraints = [
            toLabel.topAnchor.constraint(equalTo: busLogo.bottomAnchor, constant: 8),
            toLabel.leadingAnchor.constraint(equalTo: toIcon.trailingAnchor, constant: 2),
            toLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            toLabel.widthAnchor.constraint(equalToConstant: 128)
        ]
        
        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(busLogoConstraints)
        NSLayoutConstraint.activate(departureDateConstraints)
        NSLayoutConstraint.activate(departurePriceConstraints)
        NSLayoutConstraint.activate(fromLabelConstraints)
        NSLayoutConstraint.activate(toIconConstraints)
        NSLayoutConstraint.activate(toLabelConstraints)
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let newImage = renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        
        return newImage
    }
}
