//
//  CreatePostViewController.swift
//  noms
//
//  Created by Tiffany Lee on 5/2/24.
//

import Foundation

import UIKit

class CreatePostViewController: UIViewController {
    
    // MARK: - Properties (views)
    private let scrollView = UIScrollView()
    
    private let headerLabel = UILabel()
    private let dismissButton = UIButton()
    
    private let nameLabel = UILabel()
    private let nameInput =  UITextField()
    
    private let descriptionLabel = UILabel()
    private let nomDescription = UITextView()
    
    private let mealLabel = UILabel()
    private let stackView = UIStackView()
    private let breakfastButton = UIButton(type: .system)
    private let lunchButton = UIButton(type: .system)
    private let dinnerButton = UIButton(type: .system)
    
    private let dateLabel = UILabel()
    private let datePicker = UIDatePicker()
    
    private let imageLabel = UILabel()
    private let imageInput = UITextField()
    
    private let saveButton = UIButton()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
//        setupScrollView()
        setupHeaderLabel()
        setupDismissButton()
        setupNameLabel()
        setupNameInput()
        setupDescriptionLabel()
        setupDescriptionInput()
        setupMealLabel()
        setupButtons()
        setupStackView()
        setupDateLabel()
        setupDatePicker()
        setupSaveButton()
        setupImageLabel()
        setupImageInput()
    }

//    private func setupScrollView() {
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(scrollView)
//        
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }
    private func setupStackView () {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        stackView.addArrangedSubview(breakfastButton)
        stackView.addArrangedSubview(lunchButton)
        stackView.addArrangedSubview(dinnerButton)
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: mealLabel.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
//            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    private func setupHeaderLabel() {
        headerLabel.text = "Add New Nom"
        headerLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        headerLabel.textAlignment = .center
        
        view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupDismissButton() {
        dismissButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        dismissButton.tintColor = UIColor.black
        
        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
           dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
           dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
       ])
        
        dismissButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
   }
    
    private func setupNameLabel() {
        nameLabel.text = "Nom Name"
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        nameLabel.textColor = UIColor.black
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 48),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }

    private func setupNameInput() {
        nameInput.borderStyle = .roundedRect
        nameInput.placeholder = "Enter Nom Name"
        nameInput.layer.borderColor = UIColor.lightGray.cgColor
        
        view.addSubview(nameInput)
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameInput.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            nameInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.text = "Description"
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        descriptionLabel.textColor = UIColor.black
        
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    private func setupDescriptionInput() {
        nomDescription.layer.borderWidth = 1.0
        nomDescription.layer.cornerRadius = 5.0
        nomDescription.layer.borderColor = UIColor.lightGray.cgColor
        nomDescription.font = UIFont.systemFont(ofSize: 16)
        nomDescription.isScrollEnabled = true  // Ensure it's scrollable if content is larger than the view size
        
        view.addSubview(nomDescription)
        nomDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nomDescription.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            nomDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            nomDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            nomDescription.heightAnchor.constraint(equalToConstant: 64)  // Ensure there's enough height
        ])
    }
    
    private func setupMealLabel() {
        mealLabel.text = "Meal Type"
        mealLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        mealLabel.textColor = UIColor.black
        
        view.addSubview(mealLabel)
        mealLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mealLabel.topAnchor.constraint(equalTo: nomDescription.bottomAnchor, constant: 24),
            mealLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            mealLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    private func setupButtons() {
        setupButton(breakfastButton, title: "Breakfast")
        setupButton(lunchButton, title: "Lunch")
        setupButton(dinnerButton, title: "Dinner")
    }

    private func setupButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.a3.orange.cgColor
        button.layer.cornerRadius = 16
//        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private func setupDateLabel() {
        dateLabel.text = "Date"
        dateLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        dateLabel.textColor = UIColor.black
        
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline // or .inline for iOS 14 and later
//        datePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)

        view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    private func setupImageLabel() {
        imageLabel.text = "Image URL"
        imageLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        imageLabel.textColor = UIColor.black
        
        view.addSubview(imageLabel)
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 24),
            imageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            imageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }

    private func setupImageInput() {
        imageInput.borderStyle = .roundedRect
        imageInput.placeholder = "Enter Nom Name"
        imageInput.layer.borderColor = UIColor.lightGray.cgColor
        
        view.addSubview(imageInput)
        imageInput.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageInput.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 8),
            imageInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            imageInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            imageInput.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -24)
        ])
    }
    
    private func setupSaveButton() {
        saveButton.backgroundColor = UIColor.a3.coral
        saveButton.layer.cornerRadius = 8
        saveButton.setTitle("Post", for: .normal)
        saveButton.setTitleColor(UIColor.a3.white, for: .normal)
        saveButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        // saveButton.addTarget(self, action: #selector(createPost), for: .touchUpInside)
        
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        let sidePadding: CGFloat = 24
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
   
    // MARK: - Button Controls
    @objc func dismissViewController() {
        dismiss(animated: true, completion: nil)  // This will handle the button tap to dismiss the view controller
    }
}
