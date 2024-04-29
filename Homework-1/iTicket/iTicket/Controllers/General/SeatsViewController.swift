//
//  SeatsViewController.swift
//  iTicket
//
//  Created by Mert Ozseven on 23.04.2024.
//

import UIKit

class SeatsViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: iTicketViewModel
    
    private var selectedSeats = [String]()
    
    private var busSeatNumDict = [Int: String]()
    
    // MARK: - UI Components
    private let seatStatusView = SeatStatusView()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SeatCollectionViewCell.self, forCellWithReuseIdentifier: SeatCollectionViewCell.identifier)
        collectionView.alwaysBounceVertical = true
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 88, right: 0)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private lazy var buyButton: ITButton = {
        let button = ITButton(
            backgroundColor: .accent,
            title: "Satın Al",
            font: .systemFont(ofSize: 24, weight: .semibold)
        )
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configureLayout()
        configureUI()
        generateSeatNumbers()
        configureButton()
    }
    
    // MARK: - inits
    init(viewModel: iTicketViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addViews() {
        view.addSubview(seatStatusView)
        view.addSubview(collectionView)
        view.addSubview(buyButton)
    }
    
    private func configureLayout() {
        let seatStatusViewConstraints = [
            seatStatusView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            seatStatusView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            seatStatusView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            seatStatusView.heightAnchor.constraint(equalToConstant: 56)
        ]
        let collectionViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: seatStatusView.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        let buyButtonConstraints = [
            buyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            buyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buyButton.heightAnchor.constraint(equalToConstant: 48),
            buyButton.widthAnchor.constraint(equalToConstant: 128)
        ]
        
        NSLayoutConstraint.activate(seatStatusViewConstraints)
        NSLayoutConstraint.activate(collectionViewConstraints)
        NSLayoutConstraint.activate(buyButtonConstraints)
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func generateSeatNumbers() {
        var seatNumber = 1
        var pathWayNumber = 2
        for i in 0...59 {
            if i == pathWayNumber {
                busSeatNumDict[i] = ""
                pathWayNumber += 5
            } else {
                busSeatNumDict[i] = String(seatNumber)
                seatNumber += 1
            }
        }
    }
    
    private func configureButton() {
        if selectedSeats.isEmpty {
            self.buyButton.isEnabled = false
            self.buyButton.isHidden = true
        } else {
            self.buyButton.isEnabled = true
            self.buyButton.isHidden = false
        }
    }
    
    private func printFinalTicketDetails() {
        print("\nTicket Details:")
        if let currentTicket = viewModel.currentTicket {
            print("Name: \(currentTicket.passenger.name)")
            print("Surname: \(currentTicket.passenger.surname)")
            print("ID: \(currentTicket.passenger.id)")
            print("Date: \(currentTicket.date)")
            if let hour = currentTicket.hour {
                print("Hour: \(hour.hour)")
                print("Minute: \(hour.minute)")
            }
            print("From: \(currentTicket.from)")
            print("To: \(currentTicket.to)")
            print("Seats: \(selectedSeats.joined(separator: ", "))")
            print("Total Seats: \(selectedSeats.count)")
        }
        print("\nAll Tickets:")
        for ticket in viewModel.tickets {
            print("\nName: \(ticket?.passenger.name ?? "")")
            print("Surname: \(ticket?.passenger.surname ?? "")")
            print("ID: \(ticket?.passenger.id ?? "")")
            print("Date: \(ticket?.date ?? "")")
            if let hour = ticket?.hour {
                print("Hour: \(hour.hour)")
                print("Minute: \(hour.minute)")
            }
            print("From: \(ticket?.from ?? "")")
            print("To: \(ticket?.to ?? "")")
            print("Seats: \(ticket?.seat?.joined(separator: ", ") ?? "")")
            print("Toal Seats: \(ticket?.seat?.count ?? 0)\n")
        }
    }
    
    // MARK: - Objective Methods
    @objc private func buyButtonTapped() {
        if let currentTicket = viewModel.currentTicket {
            viewModel.tickets.append(currentTicket)
        }
        printFinalTicketDetails()
        if let mainTabBarController = self.tabBarController as? MainTabBarController {
            if let viewControllers = mainTabBarController.viewControllers {
                for navController in viewControllers {
                    if let navController = navController as? UINavigationController {
                        if let searchVC = navController.viewControllers.first(where: { $0 is SearchViewController }) as? SearchViewController {
                            searchVC.viewModel = viewModel
                        }
                        if let myRoutesVC = navController.viewControllers.first(where: { $0 is MyRoutesViewController }) as? MyRoutesViewController {
                            myRoutesVC.viewModel = viewModel
                        }
                    }
                }
            }
        }
        if let searchVC = navigationController?.viewControllers.first(where: { $0 is SearchViewController }) as? SearchViewController {
            navigationController?.popToViewController(searchVC, animated: true)
        }
    }
}

// MARK: - UICollectionViewDelegate Methods
extension SeatsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SeatCollectionViewCell else { return }
        
        if busSeatNumDict[indexPath.row] == "" { return }
        
        if let seatNumber = busSeatNumDict[indexPath.row], !selectedSeats.contains(seatNumber) {
            if selectedSeats.count < 5 {
                cell.containerView.backgroundColor = .systemBlue
                selectedSeats.append(seatNumber)
                viewModel.currentTicket?.seat = selectedSeats
                viewModel.currentTicket?.seatNumber = selectedSeats.count
                print("Added \(seatNumber) to selectedSeats")
            } else {
                presentITAlertOnMainThread(alertTitle: "Maksimum Koltuk Sayısına Ulaşıldı ✋🏻", message: "Lütfen en fazla 5 koltuk seçiniz.", buttonTitle: "Tamam")
            }
        } else if let index = selectedSeats.firstIndex(of: busSeatNumDict[indexPath.row] ?? "") {
            cell.containerView.backgroundColor = .systemGreen
            selectedSeats.remove(at: index)
            viewModel.currentTicket?.seat = selectedSeats
            viewModel.currentTicket?.seatNumber = selectedSeats.count
            print("Removed \(busSeatNumDict[indexPath.row] ?? "") from selectedSeats")
        }
        configureButton()
    }
    
}

// MARK: - UICollectionViewDataSource Methods
extension SeatsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeatCollectionViewCell.identifier, for: indexPath) as? SeatCollectionViewCell else {
            fatalError("Unable to dequeue SeatCollectionViewCell")
        }
        let seatNumber = busSeatNumDict[indexPath.row] ?? ""
        if seatNumber.isEmpty {
            cell.alpha = 0
            cell.containerView.backgroundColor = .systemBackground
        } else {
            cell.alpha = 1
            cell.configure(with: seatNumber)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout Methods
extension SeatsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 16) / 5
        return CGSize(width: width, height: width)
    }
    
}
