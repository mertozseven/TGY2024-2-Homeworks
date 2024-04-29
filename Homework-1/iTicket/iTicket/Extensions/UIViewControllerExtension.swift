//
//  UIViewControllerExtension.swift
//  iTicket
//
//  Created by Mert Ozseven on 28.04.2024.
//

import UIKit

extension UIViewController {
    
    // MARK: - Presenting ITAlert on maın thread
    func presentITAlertOnMainThread(alertTitle: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = ITAlertViewController(alertTitle: alertTitle, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
}
