//
//  CitySelectionView.swift
//  iTicket
//
//  Created by Mert Ozseven on 25.04.2024.
//

import UIKit

class CitySelectionView: UIView {
    
    // MARK: - UI Components
    private var cityTitleLabel = ITLabel(
        text: "Nereden",
        textAlignment: .left,
        textColor: .accent,
        font: .preferredFont(forTextStyle: .title1)
    )
    
    lazy var citySelectionPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        return pickerView
    }()

    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureViews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(cityTitle: String) {
        super.init(frame: .zero)
        self.cityTitleLabel.text = cityTitle
        addViews()
        configureViews()
        configureUI()
    }
    
    // MARK: - Private Methods
    private func addViews() {
        addSubview(cityTitleLabel)
        addSubview(citySelectionPicker)
    }
    
    private func configureViews() {
        let cityTitleLabelConstraints = [
            cityTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.padding),
            cityTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.padding),
            cityTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.padding),
            cityTitleLabel.heightAnchor.constraint(equalToConstant: Constants.componentHeight)
        ]
        let citySelectionPickerConstraints = [
            citySelectionPicker.topAnchor.constraint(equalTo: cityTitleLabel.bottomAnchor, constant: Constants.padding),
            citySelectionPicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            citySelectionPicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            citySelectionPicker.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.padding)
        ]
        
        NSLayoutConstraint.activate(cityTitleLabelConstraints)
        NSLayoutConstraint.activate(citySelectionPickerConstraints)
    }
    
    private func configureUI() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

// MARK: - UIPickerViewDataSource Methods
extension CitySelectionView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Constants.cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Constants.cities[row]
    }
    
}
