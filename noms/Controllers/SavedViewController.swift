//
//  SavedViewController.swift
//  munch_3
//
//  Created by Angelina Chen on 4/28/24.
//

import Foundation
import UIKit

class SavedViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private let nameLabel = UILabel()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupNameLabel()
    }
    
    // MARK: - Set Up Views
    
    private func setupNameLabel() {
        nameLabel.text = "Saved"
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
