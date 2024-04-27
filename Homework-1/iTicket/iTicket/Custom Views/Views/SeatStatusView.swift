//
//  SeatStatusView.swift
//  iTicket
//
//  Created by Mert Ozseven on 27.04.2024.
//

import UIKit

class SeatStatusView: UIView {
    
    // MARK: - Properties

    
    // MARK: - UI Components
    private let avaliableContainerView: ITContainerView = {
        let view = ITContainerView()
        view.backgroundColor = UIColor(hex: "#b3ffc6", alpha: 1.0)
        
        return view
    }()
    
    private let avaliableColorView: ITContainerView = {
        let view = ITContainerView()
        view.backgroundColor = UIColor(hex: "#35C759", alpha: 1.0)
        
        return view
    }()
    
    private let avaliableLabel = ITLabel(
        text: "Boş Koltuk",
        textAlignment: .center,
        textColor: UIColor(hex: "#35C759", alpha: 1.0)!,
        font: .systemFont(ofSize: 16, weight: .semibold)
    )
    
    private let soldContainerView: ITContainerView = {
        let view = ITContainerView()
        view.backgroundColor = UIColor(hex: "#32343f", alpha: 1.0)
        
        return view
    }()
    
    private let soldColorView: ITContainerView = {
        let view = ITContainerView()
        view.backgroundColor = UIColor(hex: "#E4E5E9", alpha: 1.0)
        
        return view
    }()
    
    private let soldLabel = ITLabel(
        text: "Dolu Koltuk",
        textAlignment: .center,
        textColor: UIColor(hex: "#E4E5E9", alpha: 1.0)!,
        font: .systemFont(ofSize: 16, weight: .semibold)
    )
    
    private let selectedContainerView: ITContainerView = {
        let view = ITContainerView()
        view.backgroundColor = UIColor(hex: "#c9e3ff", alpha: 1.0)
        
        return view
    }()
    
    private let selectedColorView: ITContainerView = {
        let view = ITContainerView()
        view.backgroundColor = .systemBlue
        
        return view
    }()
    
    private let selectedLabel = ITLabel(
        text: "Seçilen Koltuk",
        textAlignment: .center,
        textColor: .systemBlue,
        font: .systemFont(ofSize: 16, weight: .semibold)
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(avaliableContainerView)
        avaliableContainerView.addSubview(avaliableColorView)
        avaliableContainerView.addSubview(avaliableLabel)
        addSubview(soldContainerView)
        soldContainerView.addSubview(soldColorView)
        soldContainerView.addSubview(soldLabel)
        addSubview(selectedContainerView)
        selectedContainerView.addSubview(selectedColorView)
        selectedContainerView.addSubview(selectedLabel)
    }
    
    private func configureLayout() {
        let avaliableContainerViewConstraints = [
            avaliableContainerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            avaliableContainerView.heightAnchor.constraint(equalToConstant: 56),
            avaliableContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avaliableContainerView.trailingAnchor.constraint(equalTo: soldContainerView.leadingAnchor, constant: -8)
        ]
        let avaliableColorViewConstraints = [
            avaliableColorView.centerYAnchor.constraint(equalTo: avaliableContainerView.centerYAnchor),
            avaliableColorView.heightAnchor.constraint(equalToConstant: 32),
            avaliableColorView.leadingAnchor.constraint(equalTo: avaliableContainerView.leadingAnchor, constant: 10),
            avaliableColorView.widthAnchor.constraint(equalToConstant: 32)
        ]
        let avaliableLabelConstraints = [
            avaliableLabel.centerYAnchor.constraint(equalTo: avaliableContainerView.centerYAnchor),
            avaliableLabel.leadingAnchor.constraint(equalTo: avaliableColorView.trailingAnchor, constant: 8),
            avaliableLabel.trailingAnchor.constraint(equalTo: avaliableContainerView.trailingAnchor, constant: -10),
            avaliableLabel.bottomAnchor.constraint(equalTo: avaliableContainerView.bottomAnchor, constant: -8)
        ]
        let soldContainerViewConstraints = [
            soldContainerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            soldContainerView.heightAnchor.constraint(equalToConstant: 56),
            soldContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            soldContainerView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        let soldColorViewConstraints = [
            soldColorView.centerYAnchor.constraint(equalTo: soldContainerView.centerYAnchor),
            soldColorView.heightAnchor.constraint(equalToConstant: 32),
            soldColorView.widthAnchor.constraint(equalToConstant: 32),
            soldColorView.leadingAnchor.constraint(equalTo: soldContainerView.leadingAnchor, constant: 8)
        ]
        let soldLabelConstraints = [
            soldLabel.centerYAnchor.constraint(equalTo: soldContainerView.centerYAnchor),
            soldLabel.leadingAnchor.constraint(equalTo: soldColorView.trailingAnchor, constant: 8),
            soldLabel.trailingAnchor.constraint(equalTo: soldContainerView.trailingAnchor, constant: -8),
            soldLabel.bottomAnchor.constraint(equalTo: soldContainerView.bottomAnchor, constant: -8)
        ]
        let selectedContainerViewConstraints = [
            selectedContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            selectedContainerView.heightAnchor.constraint(equalToConstant: 56),
            selectedContainerView.leadingAnchor.constraint(equalTo: soldContainerView.trailingAnchor, constant: 8),
            selectedContainerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)
        ]
        let selectedColorViewConstraints = [
            selectedColorView.widthAnchor.constraint(equalToConstant: 32),
            selectedColorView.heightAnchor.constraint(equalToConstant: 32),
            selectedColorView.leadingAnchor.constraint(equalTo: selectedContainerView.leadingAnchor, constant: 8),
            selectedColorView.centerYAnchor.constraint(equalTo: selectedContainerView.centerYAnchor)
        ]
        let selectedLabelConstraints = [
            selectedLabel.centerYAnchor.constraint(equalTo: selectedContainerView.centerYAnchor),
            selectedLabel.leadingAnchor.constraint(equalTo: selectedColorView.trailingAnchor, constant: 8),
            selectedLabel.trailingAnchor.constraint(equalTo: selectedContainerView.trailingAnchor, constant: -8),
            selectedLabel.bottomAnchor.constraint(equalTo: selectedContainerView.bottomAnchor, constant: -8)
        ]
        
        NSLayoutConstraint.activate(avaliableContainerViewConstraints)
        NSLayoutConstraint.activate(avaliableColorViewConstraints)
        NSLayoutConstraint.activate(avaliableLabelConstraints)
        NSLayoutConstraint.activate(soldContainerViewConstraints)
        NSLayoutConstraint.activate(soldColorViewConstraints)
        NSLayoutConstraint.activate(soldLabelConstraints)
        NSLayoutConstraint.activate(selectedContainerViewConstraints)
        NSLayoutConstraint.activate(selectedColorViewConstraints)
        NSLayoutConstraint.activate(selectedLabelConstraints)
    }
    
    private func configureView() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
}

#Preview {
    SeatStatusView()
}
