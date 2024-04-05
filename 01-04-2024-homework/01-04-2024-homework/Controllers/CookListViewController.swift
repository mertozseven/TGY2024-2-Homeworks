//
//  ViewController.swift
//  01-04-2024-homework
//
//  Created by Mert Ozseven on 3.04.2024.
//

import UIKit
import SnapKit
import CoreData

class CookListViewController: UIViewController {
    
    // MARK: - Private Variables
    private var cookImages = [Data]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var cookNames = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Components
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CookListCell.self, forCellReuseIdentifier: CookListCell.identifier)
        return tableView
    }()
    
    private var addButton: UIBarButtonItem = {
        let addButton = UIBarButtonItem()
        addButton.image = .add
        return addButton
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setupUI()
        configureAddButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCooks()
    }
    // MARK: - Private Methods
    private func addViews() {
        view.addSubview(tableView)
    }
    
    private func setupUI() {
        
        title = "Cooking List"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .label
        
        view.backgroundColor = .systemBackground
        
        tableView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureAddButton() {
        addButton.target = self
        addButton.action = #selector(addButtonAction)
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    private func getCooks() {
        cookNames.removeAll()
        cookImages.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cooks")
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if !results.isEmpty {
                for result in results as! [NSManagedObject]{
                    guard let name = result.value(forKey: "name") as? String else { return }
                    cookNames.append(name)
                    guard let imageData = result.value(forKey: "image") as? Data else { return }
                    cookImages.append(imageData)
                }
            } else {
                print("veri kaydi bulunamadi")
            }
        } catch {
            print("Veriler cekilemedi")
        }
    }
    
    private func deleteCook(at indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cooks")

        do {
            let results = try context.fetch(fetchRequest)
            
            let cookToDelete = results[indexPath.row] as! NSManagedObject
            
            context.delete(cookToDelete)

            cookNames.remove(at: indexPath.row)
            cookImages.remove(at: indexPath.row)

            try context.save()
        } catch {
             print("Error deleting cook: \(error)")
        }
    }



    
    private func showDeleteConfirmationAlert(for indexPath: IndexPath) {
        let cookName = cookNames[indexPath.row]
        let alert = UIAlertController(title: "Delete Cook", message: "Are you sure you want to delete \(cookName)?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            alert.dismiss(animated: true) {
                self?.deleteCook(at: indexPath)
            }
        }))

        present(alert, animated: true)
    }
    
    // MARK: - Objective Functions
    @objc private func addButtonAction() {
        navigationController?.pushViewController(CookCreateViewController(), animated: true)
    }
    
}

// MARK: - Table View Delegate Extension
extension CookListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("SELECTED:", indexPath.row)
    }
    
}

// MARK: - Table View Data Source Extension
extension CookListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cookNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CookListCell.identifier, for: indexPath) as? CookListCell else {
            return UITableViewCell()
        }
        let image = UIImage(data: cookImages[indexPath.row]) ?? UIImage(systemName: "frying.pan")!
        let name = cookNames[indexPath.row]
        
        cell.configure(with: image, and: name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            showDeleteConfirmationAlert(for: indexPath)
        }
    }
}
