//
//  SeatCollectionViewCell.swift
//  iTicket
//
//  Created by Mert Ozseven on 26.04.2024.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "SeatCollectionViewCell"
    
    // MARK: - UI Components
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let seatLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = ""
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func configure(with seatNumber: String) {
        seatLabel.text = seatNumber
    }
    
    // MARK: - Private Methods
    private func addViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(seatLabel)
    }
    
    private func configureLayouts() {
        let containerViewConstraints = [
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
        ]
        let seatLabelConstraints = [
            seatLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            seatLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            seatLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            seatLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(seatLabelConstraints)
    }
    
    private func configureUI() {
        backgroundColor = .systemGreen
        layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        seatLabel.text = nil
        containerView.backgroundColor = .systemGreen
    }
}
