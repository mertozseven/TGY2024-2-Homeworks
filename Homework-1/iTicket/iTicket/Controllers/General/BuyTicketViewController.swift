//
//  BuyTicketViewController.swift
//  iTicket
//
//  Created by Mert Ozseven on 23.04.2024.
//

import UIKit

class BuyTicketViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: iTicketViewModel
    
    private let busLogo: [UIImage] = [
        UIImage(named: "efeTur")!,
        UIImage(named: "kamilKoc")!,
        UIImage(named: "metroTurizm")!
    ]
    
    // MARK: - UI Components
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DepartureCell.self, forCellReuseIdentifier: DepartureCell.identifier)
        tableView.separatorEffect = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configureViews()
        configureUI()
    }
    
    init(viewModel: iTicketViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
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

// MARK: - UITableViewDelegate Methods
extension BuyTicketViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(SeatsViewController(viewModel: viewModel), animated: true)
    }
    
}

// MARK: - UITableViewDataSource Methods
extension BuyTicketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DepartureCell.identifier, for: indexPath) as? DepartureCell else {
            return UITableViewCell()
        }
        guard let ticket = viewModel.currentTicket else {
            print("ticket is nil")
            return cell
        }
        cell.configure(busLogo: busLogo.randomElement()!,
                       departureDate: ticket.date,
                       fromCity: ticket.from,
                       toCity: ticket.to)
        cell.selectionStyle = .none
        return cell
    }
    
}
