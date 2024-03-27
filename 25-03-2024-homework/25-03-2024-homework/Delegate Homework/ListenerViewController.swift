//
//  ViewController.swift
//  25-03-2024-homework
//
//  Created by Mert Ozseven on 26.03.2024.
//

import UIKit

class ListenerViewController: UIViewController {
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.text = "Please press the button and send the message"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let getDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Data", for: .normal)
        button.tintColor = .label
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let gradientView: UIView = {
        let container = UIView()
        let gradient = CAGradientLayer()
        gradient.bounds = container.bounds
        gradient.colors = [
            UIColor.systemRed.cgColor,
            UIColor.systemBlue.cgColor
        ]
        return container
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addViews()
        configureView()
        didTapGetDataButton()
    }
    
    private func addViews() {
        view.addSubview(messageLabel)
        view.addSubview(getDataButton)
    }
    
    private func configureView() {
        
        let messageLabelConstraints = [
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            messageLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -16),
            messageLabel.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        let getDataButtonConstraints = [
            getDataButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            getDataButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            getDataButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            getDataButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(messageLabelConstraints)
        NSLayoutConstraint.activate(getDataButtonConstraints)
        
    }
    
    private func didTapGetDataButton() {
        getDataButton.addTarget(self, action: #selector(getDataButonAction), for: .touchUpInside)
    }
    
    @objc func getDataButonAction() {
        print("button tapped")
        let senderVC = SenderViewController()
        senderVC.delegate = self
        senderVC.modalPresentationStyle = .pageSheet
        present(senderVC, animated: true)
    }
    
    
}

extension ListenerViewController: MessageDelegate {
    
    func sendMessage(text: String) {
        messageLabel.text = text
    }
    
}
