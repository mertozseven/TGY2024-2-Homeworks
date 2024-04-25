//
//  TicketsViewController.swift
//  iTicket
//
//  Created by Mert Ozseven on 22.04.2024.
//

import UIKit

class MyRoutesViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configureViews()
        configureUI()
    }
    
    // MARK: - Private Methods
    private func addViews() {
        
    }
    
    private func configureViews() {
        
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let newImage = renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        
        return newImage
    }

}
