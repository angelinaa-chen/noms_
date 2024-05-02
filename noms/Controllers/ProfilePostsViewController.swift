//
//  ProfileViewController.swift
//  munch_3
//
//  Created by Angelina Chen on 4/28/24.
//

import UIKit

class ProfilePostViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private let nameLabel = UILabel()
    
//    private weak var delegate: UpdateTextDelegate?
//    private weak var delegate2: UpdateTextDelegate?
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupNameLabel()
    }
    
    // MARK: - Set Up Views
    
    private func setupNameLabel() {
        nameLabel.text = "Profile / Meal Plan"
        nameLabel.font = .systemFont(ofSize: 24)
        nameLabel.textColor = UIColor.black

        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    

}

