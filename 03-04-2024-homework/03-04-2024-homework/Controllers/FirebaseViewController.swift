//
//  FirebaseViewController.swift
//  03-04-2024-homework
//
//  Created by Mert Ozseven on 5.04.2024.
//

import UIKit
import SnapKit
import FirebaseDatabase

class FirebaseViewController: UIViewController {

    // MARK: - Private Variables
    private var users = [User]()
    
    private var ref: DatabaseReference!
    
    // MARK: - Components
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FirebaseCell.self, forCellReuseIdentifier: FirebaseCell.identifier)
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
//        users.append(User(id: 1, name: "Ali Hızardere"))
//        users.append(User(id: 2, name: "Furkan Melik Demiray"))
//        users.append(User(id: 3, name: "Furkan Fatih Kök"))
//        
//        for user in users {
//            ref.child("users").child("\(user.id ?? 0)").setValue(["username": user.name])
//        }
        
        addViews()
        setupUI()
        getKey()
    }
    
    // MARK: - Private Methods
    private func addViews() {
        view.addSubview(tableView)
    }
    
    private func setupUI() {
        
        title = "Names"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .label
        
        view.backgroundColor = .systemBackground
        
        tableView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func getKey() {
        let ref = Database.database().reference().child("users")
        ref.observeSingleEvent(of: .value) { [weak self] snapshot in
            guard let self else { return }
            for children in snapshot.children {
                let key = (children as AnyObject).key as String
                getUser(key)
            }
        }
    }
    
    private func getUser(_ key: String) {
        let newRef = ref.child("users").child(key)
        newRef.observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let self else { return }
            let dictionary = snapshot.value as? [String : Any] ?? ["Unknown": ""]
            let name = dictionary["username"] as? String ?? "Unknown"
            self.users.append(.init(id: Int(key), name: name))
            self.tableView.reloadData()
        })
    }

}

extension FirebaseViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirebaseCell.identifier, for: indexPath) as? FirebaseCell else {
            return UITableViewCell()
        }
        let name = users[indexPath.row].name
        cell.configure(with: name ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

extension FirebaseViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        48
    }
    
}
