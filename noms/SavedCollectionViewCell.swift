//
//  SavedCollectionViewCell.swift
//  noms
//
//  Created by Tiffany Lee on 5/1/24.
//

import UIKit

class UITagLabel: UILabel {
    var textInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let width = size.width + textInsets.left + textInsets.right
        let height = size.height + textInsets.top + textInsets.bottom
        return CGSize(width: width, height: height)
    }

    override var bounds: CGRect {
        didSet {
            // Ensures that the content size is updated when the bounds change
            preferredMaxLayoutWidth = bounds.width - (textInsets.left + textInsets.right)
        }
    }
}

class SavedCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties (view)
    
    private let nomName = UILabel()
    private let nomImage = UIImageView()
    private let nomDescription = UITextView()
    private let nomType = UITagLabel()
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
        setupAddButton()
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
//        nomImage.clipsToBounds = true
//        nomImage.contentMode = .scaleAspectFit
        nomImage.layer.masksToBounds = true
        nomImage.layer.cornerRadius = 8  // Set corner radius to 8 pixels
        
        contentView.addSubview(nomImage)
        nomImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nomImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nomImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            nomImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16),
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
            nomName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            // TODO: Add trailing constraint for button
        ])
    }
    
    func setupPostType() {
        nomType.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        nomType.backgroundColor = UIColor.a3.orange
        nomType.textColor = UIColor.white
        nomType.layer.cornerRadius = 10 // Adjust as needed
        nomType.clipsToBounds = true
        nomType.textAlignment = .center
        
        contentView.addSubview(nomType)
        nomType.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nomType.topAnchor.constraint(equalTo: nomName.bottomAnchor, constant: 4),
            nomType.leadingAnchor.constraint(equalTo: nomImage.trailingAnchor, constant: 16),
            nomType.heightAnchor.constraint(equalToConstant: 18) // Adjust based on your design
        ])

    }
    
    func setupPostDescription() {
        nomDescription.isEditable = false
        nomDescription.isScrollEnabled = false // Disable scrolling to ensure UITextView sizes itself to its content
        nomDescription.font = .systemFont(ofSize: 10, weight: .regular)
        nomDescription.textColor = UIColor.black
        nomDescription.backgroundColor = UIColor.a3.offWhite
        
        contentView.addSubview(nomDescription)
        nomDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nomDescription.topAnchor.constraint(equalTo: nomType.bottomAnchor, constant: 12),
            nomDescription.leadingAnchor.constraint(equalTo: nomImage.trailingAnchor, constant: 16),
            nomDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            nomDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            nomDescription.bottomAnchor.constraint(equalTo: nomImage.bottomAnchor) // Align bottom with nomImage

        ])
    }
    
    func setupAddButton() {
        addNom.contentMode = .scaleAspectFit
        addNom.setImage(UIImage(systemName: "plus"), for: .normal)
        
        
        contentView.addSubview(addNom)
        addNom.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addNom.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            addNom.leadingAnchor.constraint(equalTo: nomName.trailingAnchor, constant: 8),
            addNom.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            addNom.widthAnchor.constraint(equalToConstant: 24),
            addNom.heightAnchor.constraint(equalToConstant: 24)
        ])
        
    }
}
