//
//  TicketsViewController.swift
//  iTicket
//
//  Created by Mert Ozseven on 22.04.2024.
//

import UIKit

class MyRoutesViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: iTicketViewModel {
        didSet {
            configureEmptyView()
            tableView.reloadData()
        }
    }
    
    private var googleURL = "https://www.google.com/search?q="
    
    // MARK: - UI Components
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorEffect = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(MyRoutesCell.self, forCellReuseIdentifier: MyRoutesCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private lazy var emptyView = EmptyView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configureViews()
        configureUI()
        configureEmptyView()
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
        view.addSubview(tableView)
        view.addSubview(emptyView)
    }
    
    private func configureViews() {
        let tableviewConstraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        let emptyViewConstraints = [
            emptyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                          constant: 16),
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: 16),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -16),
            emptyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                              constant: -16)
        ]
        
        NSLayoutConstraint.activate(tableviewConstraints)
        NSLayoutConstraint.activate(emptyViewConstraints)
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Biletlerim"
        if let savedTicketsData = UserDefaults.standard.data(forKey: "tickets") {
            if let savedTickets = try? JSONDecoder().decode([Ticket].self, from: savedTicketsData) {
                viewModel.tickets = savedTickets
            }
        }
    }
    
    private func configureEmptyView() {
        if viewModel.tickets.isEmpty {
            emptyView.isHidden = false
            tableView.isHidden = true
        } else {
            emptyView.isHidden = true
            tableView.isHidden = false
        }
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let newImage = renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        
        return newImage
    }
    
}

extension MyRoutesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyRoutesCell.identifier, for: indexPath) as? MyRoutesCell else {
            return UITableViewCell()
        }
        if let ticket = viewModel.tickets[indexPath.row] {
            let hourString = ticket.hour.map { String(format: "%02d:%02d", $0.hour, $0.minute) } ?? ""
            let seatString = ticket.seat?.joined(separator: ", ") ?? ""
            cell.configure(
                departureDate: ticket.date,
                departureHour: hourString,
                name: ticket.passenger.name,
                surname: ticket.passenger.surname,
                from: ticket.from,
                to: ticket.to,
                seat: seatString,
                qrCodeString: "\(googleURL)Name: \(ticket.passenger.name), Surname: \(ticket.passenger.surname), From: \(ticket.from), To: \(ticket.to), Departure Date: \(ticket.date), Departure Hour: \(hourString), Seat: \(seatString)"
            )
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
}

extension MyRoutesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        426
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

