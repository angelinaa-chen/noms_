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
    private let headerLabel = UILabel()
    private let dismissButton = UIButton()
    private let segmentedControl = UISegmentedControl(items: ["Breakfast", "Lunch", "Dinner"])
    private let descriptionTextView = UITextView()
    private let saveButton = UIButton()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupHeaderLabel()
    }

    private func setupHeaderLabel() {
        headerLabel.text = "Add New Nom"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 18)
        headerLabel.textAlignment = .center
        
        view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
