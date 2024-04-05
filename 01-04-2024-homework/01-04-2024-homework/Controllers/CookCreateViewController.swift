//
//  CookCreateViewController.swift
//  01-04-2024-homework
//
//  Created by Mert Ozseven on 3.04.2024.
//

import UIKit
import SnapKit
import CoreData

class CookCreateViewController: UIViewController {
    
    // MARK: - Private variables
    private var cookImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo.badge.plus")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private var cookNameTextField: UITextField = {
        let textField = UITextField()
//        textField.layer.borderWidth = 2
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private var saveButton: UIButton = {
       let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .label
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        configureUI()
        configureTapGesture()
        tappedSaveButton()
    }
    
    // MARK: - Private Methods
    private func addViews() {
        view.addSubview(cookImage)
        view.addSubview(cookNameTextField)
        view.addSubview(saveButton)
    }
    
    private func configureUI() {
        
        view.backgroundColor = .systemBackground
        
        cookImage.snp.makeConstraints {
            $0.height.width.equalTo(368)
            $0.top.equalTo(view.snp_topMargin)
            $0.centerX.equalTo(view.snp_centerXWithinMargins)
        }
        
        cookNameTextField.snp.makeConstraints {
            $0.top.equalTo(cookImage.snp_bottomMargin).offset(16)
            $0.width.equalTo(cookImage.snp.width)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(32)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(cookNameTextField.snp_bottomMargin).offset(16)
            $0.height.equalTo(40)
            $0.width.equalTo(cookImage.snp.width).dividedBy(3)
            $0.centerX.equalTo(view.snp_centerXWithinMargins)
        }
        
    }
    
    private func tappedSaveButton() {
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
    
    private func configureTapGesture() {
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(chooseImage))
        cookImage.addGestureRecognizer(tap)
    }
    
    @objc private func saveButtonAction() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context  = appDelegate.persistentContainer.viewContext
        
        let newCook = NSEntityDescription.insertNewObject(forEntityName: "Cooks", into: context)
        newCook.setValue(cookNameTextField.text, forKey: "name")
        
        let imageData = cookImage.image?.jpegData(compressionQuality: 0.5)
        newCook.setValue(imageData, forKey: "image")
        
        do {
            try context.save()
            print("\(String(describing: cookNameTextField.text))")
        } catch {
            print("error while saving")
        }
        
        
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func chooseImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        
    }
    
}

extension CookCreateViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        cookImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true)
    }
    
}
