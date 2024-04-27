//
//  SearchViewController.swift
//  iTicket
//
//  Created by Mert Ozseven on 22.04.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel = iTicketViewModel()
    
    // MARK: - UI Components
    private var topGradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5)
        
        return gradientLayer
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var nameContainerView = ITContainerView()
    
    private var nameTextField = ITTextField(
        placeholder: "İsim",
        textAlignment: .center,
        textColor: .label,
        font: .preferredFont(forTextStyle: .title2),
        backgroundColor: .tertiarySystemBackground,
        cornerRadius: 10
    )
    
    private var surnameTextField = ITTextField(
        placeholder: "Soy İsim",
        textAlignment: .center,
        textColor: .label,
        font: .preferredFont(forTextStyle: .title2),
        backgroundColor: .tertiarySystemBackground,
        cornerRadius: 10
    )
    
    private var fromCityView = CitySelectionView(cityTitle: "Nereden")
    
    private var toCityView = CitySelectionView(cityTitle: "Nereye")
    
    private var departureDateContainerView = ITContainerView()
    
    private var departureDateTitleLabel = ITLabel(
        text: "Gidiş Tarihi",
        textAlignment: .left,
        textColor: .accent,
        font: .preferredFont(forTextStyle: .title1)
    )
    
    private var departureDateSelectionPicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.calendar = .current
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
    }()
    
    private lazy var searchButton: ITButton = {
        let button = ITButton(
            backgroundColor: .accent,
            title: "Otobüs Ara",
            font: .preferredFont(forTextStyle: .title1)
        )
        button.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configureViews()
        configureUI()
        createDismissKeyboardTapGesture()
    }
    
    // MARK: - Private Methods
    private func addViews() {
        view.layer.insertSublayer(topGradientLayer, at: 0)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(nameContainerView)
        nameContainerView.addSubview(nameTextField)
        nameContainerView.addSubview(surnameTextField)
        contentView.addSubview(fromCityView)
        contentView.addSubview(toCityView)
        contentView.addSubview(departureDateContainerView)
        departureDateContainerView.addSubview(departureDateTitleLabel)
        departureDateContainerView.addSubview(departureDateSelectionPicker)
        contentView.addSubview(searchButton)
    }
    
    private func configureViews() {

        let scrollViewConstraints = [
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        let contentViewConstraints = [
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        ]
        let nameContainerViewConstraints = [
            nameContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding),
            nameContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            nameContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.padding),
            nameContainerView.heightAnchor.constraint(equalToConstant: Constants.containerHeight)
        ]
        let nameTextFieldConstraints = [
            nameTextField.topAnchor.constraint(equalTo: nameContainerView.topAnchor, constant: Constants.padding),
            nameTextField.leadingAnchor.constraint(equalTo: nameContainerView.leadingAnchor, constant: Constants.padding),
            nameTextField.trailingAnchor.constraint(equalTo: nameContainerView.trailingAnchor, constant: -Constants.padding),
            nameTextField.heightAnchor.constraint(equalToConstant: Constants.componentHeight)
        ]
        let surnameTextFieldConstraints = [
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: Constants.padding),
            surnameTextField.leadingAnchor.constraint(equalTo: nameContainerView.leadingAnchor, constant: Constants.padding),
            surnameTextField.trailingAnchor.constraint(equalTo: nameContainerView.trailingAnchor, constant: -Constants.padding),
            surnameTextField.heightAnchor.constraint(equalToConstant: Constants.componentHeight)
        ]
        let fromCityViewConstraints = [
            fromCityView.topAnchor.constraint(equalTo: nameContainerView.bottomAnchor, constant: Constants.padding),
            fromCityView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            fromCityView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.padding),
            fromCityView.heightAnchor.constraint(equalToConstant: 2 * Constants.containerHeight)
        ]
        let toCityViewConstraints = [
            toCityView.topAnchor.constraint(equalTo: fromCityView.bottomAnchor, constant: Constants.padding),
            toCityView.leadingAnchor.constraint(equalTo: fromCityView.leadingAnchor),
            toCityView.trailingAnchor.constraint(equalTo: fromCityView.trailingAnchor),
            toCityView.heightAnchor.constraint(equalToConstant: 2 * Constants.containerHeight)
        ]
        let departureDateContainerViewConstraints = [
            departureDateContainerView.topAnchor.constraint(equalTo: toCityView.bottomAnchor, constant: Constants.padding),
            departureDateContainerView.leadingAnchor.constraint(equalTo: fromCityView.leadingAnchor),
            departureDateContainerView.trailingAnchor.constraint(equalTo: fromCityView.trailingAnchor),
            departureDateContainerView.heightAnchor.constraint(equalToConstant: Constants.containerHeight)
        ]
        let departureDateTitleLabelConstraints = [
            departureDateTitleLabel.topAnchor.constraint(equalTo: departureDateContainerView.topAnchor, constant: Constants.padding),
            departureDateTitleLabel.leadingAnchor.constraint(equalTo: departureDateContainerView.leadingAnchor, constant: Constants.padding),
            departureDateTitleLabel.trailingAnchor.constraint(equalTo: departureDateContainerView.trailingAnchor, constant: -Constants.padding),
            departureDateTitleLabel.heightAnchor.constraint(equalToConstant: Constants.componentHeight)
        ]
        let departureDateSelectionPickerConstraints = [
            departureDateSelectionPicker.topAnchor.constraint(equalTo: departureDateTitleLabel.bottomAnchor, constant: Constants.padding),
            departureDateSelectionPicker.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            departureDateSelectionPicker.heightAnchor.constraint(equalToConstant: Constants.componentHeight),
            departureDateSelectionPicker.widthAnchor.constraint(equalToConstant: 120)
        ]
        let searchButtonConstraints = [
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 160),
            searchButton.topAnchor.constraint(equalTo: departureDateContainerView.bottomAnchor, constant: 32),
            searchButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -32)
        ]
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(contentViewConstraints)
        NSLayoutConstraint.activate(nameContainerViewConstraints)
        NSLayoutConstraint.activate(nameTextFieldConstraints)
        NSLayoutConstraint.activate(surnameTextFieldConstraints)
        NSLayoutConstraint.activate(fromCityViewConstraints)
        NSLayoutConstraint.activate(toCityViewConstraints)
        NSLayoutConstraint.activate(departureDateContainerViewConstraints)
        NSLayoutConstraint.activate(departureDateTitleLabelConstraints)
        NSLayoutConstraint.activate(departureDateSelectionPickerConstraints)
        NSLayoutConstraint.activate(searchButtonConstraints)
        
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Ara"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let newImage = renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        
        return newImage
    }
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Objective Methods
    @objc private func searchButtonAction() {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        guard let surname = surnameTextField.text, !surname.isEmpty else { return }
        let fromIndex = fromCityView.citySelectionPicker.selectedRow(inComponent: 0)
        let toIndex = toCityView.citySelectionPicker.selectedRow(inComponent: 0)
        let fromCity = Constants.cities[fromIndex]
        let toCity = Constants.cities[toIndex]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date = dateFormatter.string(from: departureDateSelectionPicker.date)
        print("\(name),\(surname),\(fromCity),\(toCity),\(date)")
        let ticket = Ticket(passenger: Passenger(name: name, surname: surname, id: 1), date: date, hour: nil, seat: nil, seatNumber: nil, from: fromCity, to: toCity)
        viewModel.currentTicket = ticket
        let buyTicketVC = BuyTicketViewController(viewModel: viewModel)
        navigationController?.pushViewController(buyTicketVC, animated: true)
    }
    
}

#Preview {
    MainTabBarController()
}
