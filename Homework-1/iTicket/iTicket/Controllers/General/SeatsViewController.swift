//
//  SeatsViewController.swift
//  iTicket
//
//  Created by Mert Ozseven on 23.04.2024.
//

import UIKit

class SeatsViewController: UIViewController {
    
    // MARK: - Properties
    private var busSeatNumDict = [Int: String]()
    private var selectedSeats: Int?
    
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
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configureLayout()
        configureUI()
        generateSeatNumbers()
    }
    
    private func addViews() {
        view.addSubview(seatStatusView)
        view.addSubview(collectionView)
    }
    
    private func configureLayout() {
        let seatStatusViewConstraints = [
            seatStatusView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            seatStatusView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            seatStatusView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            seatStatusView.heightAnchor.constraint(equalToConstant: 56)
        ]
        let collectionViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: seatStatusView.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(seatStatusViewConstraints)
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
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
        let width = (UIScreen.main.bounds.width - 32) / 5
        return CGSize(width: width, height: width)
    }
    
}

#Preview {
    SeatsViewController()
}
