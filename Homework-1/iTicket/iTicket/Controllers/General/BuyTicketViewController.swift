//
//  BuyTicketViewController.swift
//  iTicket
//
//  Created by Mert Ozseven on 23.04.2024.
//

import UIKit

class BuyTicketViewController: UIViewController {
    
    private var name: String?
    private var surname: String?
    
    private var busLogo: [UIImage] = [
        UIImage(named: "efeTur")!,
        UIImage(named: "kamilKoc")!,
        UIImage(named: "metroTurizm")!
    ]
    
    private var departureDate: String?
    
    private var fromCity: String?
    
    private var toCity: String?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DepartureCell.self, forCellReuseIdentifier: DepartureCell.identifier)
        tableView.separatorEffect = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configureViews()
        configureUI()
        let searchVC = SearchViewController()
        searchVC.onSearchCompletion = { [weak self] name, surname, from, to, date in
            self?.name = name
            self?.surname = surname
            self?.fromCity = from
            self?.toCity = to
            self?.departureDate = date
            print("Closure calisio")
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
//        let senderVC = SearchViewController()
//        senderVC.delegate = self
    }
    
    private func addViews() {
        view.addSubview(tableView)
    }
    
    private func configureViews() {
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.padding),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(tableViewConstraints)
    }
    
}

extension BuyTicketViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        128
    }
    
}

extension BuyTicketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DepartureCell.identifier, for: indexPath) as? DepartureCell else {
            return UITableViewCell()
        }
        cell.configure(busLogo: busLogo.randomElement()!,
                       departureDate: departureDate ?? "Lorem Ipsum",
                       fromCity: fromCity ?? "Lorem Ipsum",
                       toCity: toCity ?? "Lorem Ipsum")
        return cell
    }
    
}

#Preview {
    BuyTicketViewController()
}
