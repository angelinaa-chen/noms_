//
//  SavedCollectionViewCell.swift
//  noms
//
//  Created by Tiffany Lee on 5/1/24.
//

import UIKit

class SavedCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties (view)
    
    private let nomName = UILabel()
    private let nomImage = UIImageView()
    private let nomDescription = UITextView()
    private let nomType = UILabel()
    private let addNom = UIButton()
    
    static let reuse = "SavedCollectionViewCellReuse"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.a3.offWhite
        // contentView.layer.cornerRadius = 16
        
        // Helper Functions
        setupPostImage()
        setupPostName()
        setupPostType()
        setupPostDescription()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Configure
    func configure(nom: Nom) {
        nomName.text = nom.name
//      image will be an array, how do we change that?
        // use a placeholder image for now
        nomImage.image = UIImage(named: "food_image")
        nomDescription.text = nom.description
        nomType.text = nom.meal
        
        // placeholder data for now
//        nomName.text = "Recipe Name"
//        nomImage.image = UIImage(named: "food_image")
//        nomDescription.text = "Here is the description"
//        nomType.text = "Breakfast"
    }
    
    // MARK: - Set Up Views
    func setupPostImage() {
        nomImage.contentMode = .scaleAspectFit
        nomImage.clipsToBounds = true
        nomImage.layer.cornerRadius = 8  // Set corner radius to 8 pixels
        
        contentView.addSubview(nomImage)
        nomImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nomImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nomImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nomImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16),
            nomImage.heightAnchor.constraint(equalToConstant: 128),
            nomImage.widthAnchor.constraint(equalToConstant: 128)
        ])
    }
    
    func setupPostName() {
        nomName.font = .systemFont(ofSize: 14, weight: .semibold)
        nomName.textColor = UIColor.black
        
        contentView.addSubview(nomName)
        nomName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nomName.leadingAnchor.constraint(equalTo: nomImage.trailingAnchor, constant: 16),
            nomName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            // TODO: Add trailing constraint for button
        ])
    }
    
    func setupPostType() {
        nomType.font = .systemFont(ofSize: 8, weight: .semibold)
        nomType.backgroundColor = UIColor.a3.darkGreen
        nomType.textColor = UIColor.white
        nomType.textAlignment = .center
        nomType.layer.cornerRadius = 10
        nomType.clipsToBounds = true
        
        contentView.addSubview(nomType)
        nomType.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nomType.leadingAnchor.constraint(equalTo: nomImage.trailingAnchor, constant: 16),
            nomType.topAnchor.constraint(equalTo: nomName.bottomAnchor, constant: 4)
        ])
    }
    
    func setupPostDescription() {
        nomDescription.isEditable = false
        nomDescription.font = .systemFont(ofSize: 10, weight: .regular)
        nomDescription.textColor = UIColor.black
        nomDescription.backgroundColor = UIColor.a3.offWhite
        
        contentView.addSubview(nomDescription)
        nomDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nomDescription.topAnchor.constraint(equalTo: nomType.bottomAnchor, constant: 12),
            nomDescription.leadingAnchor.constraint(equalTo: nomImage.trailingAnchor, constant: 16),
            nomDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nomDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
