//
//  ITAlertViewController.swift
//  iTicket
//
//  Created by Mert Ozseven on 25.04.2024.
//

import UIKit

class ITAlertViewController: UIViewController {

    // MARK: - Properties
    private var alertTitle: String?
    private var message: String?
    private var buttonTitle: String?
    
    private let padding: CGFloat = 20
    
    // MARK: - UI Components
    private lazy var containerView = ITContainerView()
    
    private lazy var titleLabel = ITLabel(text: alertTitle ?? "Something went wrong", textAlignment: .center, textColor: .systemRed, font: .systemFont(ofSize: 20, weight: .bold))
    
    private lazy var messageLabel: ITLabel = {
        let label = ITLabel(text: message ?? "Unable to complete request", textAlignment: .center, textColor: .label, font: .preferredFont(forTextStyle: .body))
        label.numberOfLines = 4
        
        return label
    }()
    
    private lazy var actionButton = ITButton(backgroundColor: .systemRed, title: "Okay", font: .preferredFont(forTextStyle: .headline))
    
    // MARK: - inits
    init(alertTitle: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(
            red: 0,
            green: 0,
            blue: 0,
            alpha: 0.75
        )
        addViews()
        configureViews()
        configureUI()
    }
    
    // MARK: - Private Methods
    private func addViews() {
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(actionButton)
        containerView.addSubview(messageLabel)
    }
    
    private func configureViews() {
        let containerViewConstraints = [
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ]
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ]
        let actionButtonConstraints = [
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ]
        let messageLabelConstraints = [
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ]
        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(actionButtonConstraints)
        NSLayoutConstraint.activate(messageLabelConstraints)
    }
    
    private func configureUI() {
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    @objc fileprivate func dismissVC() {
        dismiss(animated: true)
    }

}

#Preview {
    ITAlertViewController(alertTitle: "deneme", message: "denemesgfsdfsadfasdfasdfasdfdsafssadfasdfsdaasddsfdasdsdfasdfasdfasdfsadfdsaasdfsadfasdfasdf", buttonTitle: "deneme")
}
