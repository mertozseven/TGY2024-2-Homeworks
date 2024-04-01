//
//  SearchBarViewController.swift
//  25-03-2024-homework
//
//  Created by Mert Ozseven on 26.03.2024.
//

import UIKit

class SearchBarViewController: UIViewController {
    
    var users: [User] = []
    
    var filteredUsers: [User] = []
    
    var isFiltering: Bool = false
    
    private let noResultsView: CustomEmptyView = {
        let view = CustomEmptyView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = .add
        return button
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.clipsToBounds = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        tableView.dataSource = self
        tableView.delegate = self
        
        searchBar.delegate = self
        
        addViews()
        configureView()
        configurePlusButton()
        
        noResultsView.isHidden = true
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: urlString) else { return }
        
        guard let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: url)) else { return }
        
        self.users = users
    }
    
    private func addViews() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(noResultsView)
    }
    
    private func configureView() {
        
        let searchBarConstraints = [
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 56)
        ]
        
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        let noResultsViewConstraints = [
            noResultsView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            noResultsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            noResultsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            noResultsView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(searchBarConstraints)
        NSLayoutConstraint.activate(tableViewConstraints)
        NSLayoutConstraint.activate(noResultsViewConstraints)
    }
    
    private func configurePlusButton() {
        plusButton.target = self
        plusButton.action = #selector(didTapPlusButton)
        self.navigationItem.rightBarButtonItem = plusButton
    }
    
    @objc private func didTapPlusButton() {
        let alertController = UIAlertController(title: "New Item", message: "Please enter a new item", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Type Here"
        }
        
        let submitAction = UIAlertAction(title: "OK", style: .default) { [unowned alertController] _ in
            let newUser = User(name: alertController.textFields![0].text, username: "", email: "", company: Company(name: ""))
            self.users.append(newUser)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(submitAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
    
    
}

extension SearchBarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredUsers.count
        }
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("The TableView could not dequeue the CustomCell in HomeVC.")
        }
        if isFiltering {
            cell.configure(with: filteredUsers[indexPath.row].name ?? "NaN")
        } else {
            cell.configure(with: users[indexPath.row].name ?? "NaN")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let alertController = UIAlertController(title: "Delete Item", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [unowned self] _ in
                self.users.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alertController.addAction(deleteAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return !isFiltering
    }
}

extension SearchBarViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isFiltering = true
        filteredUsers = users.filter({ user -> Bool in
            return user.name?.lowercased().contains(searchText.lowercased()) ?? false
        })
        if filteredUsers.isEmpty {
            tableView.isHidden = true
            noResultsView.isHidden = false
        } else {
            tableView.isHidden = false
            noResultsView.isHidden = true
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        tableView.isHidden = false
        noResultsView.isHidden = true
        tableView.reloadData()
    }
    
}


