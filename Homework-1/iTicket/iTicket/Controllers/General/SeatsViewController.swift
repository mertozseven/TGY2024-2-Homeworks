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
    
    private var busSeatNumDict = [Int: String]()
    
    private var selectedSeats = [String]()
    
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
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private lazy var buyButton: ITButton = {
        let button = ITButton(
            backgroundColor: .systemPink,
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
    
    // MARK: - Objective Methods
    @objc private func buyButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension SeatsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeatCollectionViewCell.identifier, for: indexPath) as? SeatCollectionViewCell else {
            fatalError("Unable to dequeue SeatCollectionViewCell")
        }
        let text = busSeatNumDict[indexPath.row] ?? ""
        if text.isEmpty {
            cell.alpha = 0
            cell.containerView.backgroundColor = .systemBackground
        } else {
            cell.alpha = 1
            cell.configure(with: text)
        }
        
        return cell
    }
}

extension SeatsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
}

extension SeatsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 16) / 5
        return CGSize(width: width, height: width)
    }
    
}

#Preview {
    SeatsViewController(viewModel: iTicketViewModel())
}
