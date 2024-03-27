//
//  SenderViewController.swift
//  25-03-2024-homework
//
//  Created by Mert Ozseven on 26.03.2024.
//

import UIKit

protocol MessageDelegate: AnyObject {
    func sendMessage(text: String)
}

class SenderViewController: UIViewController {
    
    weak var delegate: MessageDelegate?
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type here..."
        textField.textColor = .label
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        
        textField.font = .systemFont(ofSize: 22, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let sendDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send Data", for: .normal)
        button.tintColor = .label
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addViews()
        configureView()
        didTapSendDataButton()
    }
    
    private func addViews() {
        view.addSubview(textField)
        view.addSubview(sendDataButton)
    }
    
    private func configureView() {
        
        let textFieldConstraints = [
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let sendDataButtonConstraints = [
            sendDataButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            sendDataButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            sendDataButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            sendDataButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(textFieldConstraints)
        NSLayoutConstraint.activate(sendDataButtonConstraints)
    }
    
    private func didTapSendDataButton() {
        sendDataButton.addTarget(self, action: #selector(sendDataButtonAction), for: .touchUpInside)
    }
    
    @objc func sendDataButtonAction() {
        guard let text = textField.text else { return }
        delegate?.sendMessage(text: text)
        dismiss(animated: true)
    }
}


