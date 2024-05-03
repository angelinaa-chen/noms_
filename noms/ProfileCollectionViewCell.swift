//
//  ProfileCollectionViewCell.swift
//  noms
//
//  Created by Angelina Chen on 5/1/24.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    static let reuse = "ProfileCollectionViewCellReuse"
    
    private var profilePost: Profile_Post?
    private let foodImage = UIImageView()
    private let foodName = UILabel()
    private let foodMeal = UIButton()
    private let foodDescription = UILabel()
    private let roundedView = UIView()
    private let foodDesc = UITextView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        setupFoodImage()
        setupFoodName()
        setupFoodMeal()
        setupFoodDescription()
        
//        setupFoodDesc()
//        setupCollectionView()
        
//        setupProfileImage()
//        setupNameLabel()
//        setupDate()
//        setupRedArrow()

//        setupRoundedText()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(profilePost: Profile_Post) {
        foodImage.image = UIImage(named: profilePost.image)
        foodName.text = profilePost.name
        foodMeal.setTitle(profilePost.meal, for: .normal)
//        foodMeal.text = profilePost.meal
        foodDescription.text = profilePost.description
        foodDesc.text = profilePost.description
    }
    
    private func setupFoodImage() {
        // foodImage.contentMode = .scaleAspectFit
        foodImage.image = UIImage(named: "food_image")
        foodImage.layer.masksToBounds = true
        foodImage.layer.cornerRadius = 16
        
        contentView.addSubview(foodImage)
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            foodImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            foodImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            foodImage.widthAnchor.constraint(equalToConstant: 32),
            foodImage.heightAnchor.constraint(equalToConstant: 32)
        ])

    }
    
    private func setupFoodName() {
        foodName.text = "Unnamed"
        foodName.textColor = UIColor.black
        foodName.font = .systemFont(ofSize:18, weight: .medium)
        
        
        
        contentView.addSubview(foodName)
        foodName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodName.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 10)
        ])
    }
    
    
    private func setupFoodMeal() {
        foodMeal.setTitle("Unnamed again", for: .normal)
        foodMeal.titleLabel?.font = .systemFont(ofSize: 11, weight: .medium)
        foodMeal.setTitleColor(UIColor.white, for: .normal)
        foodMeal.backgroundColor = UIColor.a3.light_red
        foodMeal.layer.cornerRadius = 10
        foodMeal.contentEdgeInsets = UIEdgeInsets(top: 4, left: 20, bottom: 4, right: 20)




//        foodMeal.text = "Unnamed (again)"
//        foodMeal.textColor = UIColor.white
//        foodMeal.font = .systemFont(ofSize: 11, weight: .medium)
//        foodMeal.backgroundColor = UIColor.a3.light_red
//        foodMeal.layer.cornerRadius = 16
//        foodMeal.clipsToBounds = true
//        foodMeal.contentEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)


        
        contentView.addSubview(foodMeal)
        foodMeal.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodMeal.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodMeal.topAnchor.constraint(equalTo: foodName.bottomAnchor, constant: 7)
        ])
        
        contentView.bringSubviewToFront(foodMeal)

    }
    
    private func setupFoodDescription() {
        foodDescription.text = "Unnamed (again)"
        foodDescription.textColor = UIColor.lightGray
        foodDescription.font = .systemFont(ofSize:14, weight: .medium)
        foodDescription.numberOfLines = 5
        
        contentView.addSubview(foodDescription)
        foodDescription.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            foodDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodDescription.topAnchor.constraint(equalTo: foodMeal.bottomAnchor, constant: 13)
        ])
    }
    
    private func setupFoodDesc() {
        foodDesc.font = .systemFont(ofSize: 10, weight: .semibold)
        foodDesc.textColor = UIColor.lightGray
        foodDesc.textAlignment = .left
        foodDesc.text = "If you're reading this it didn't work :("
        
        contentView.addSubview(foodDesc)
        foodDesc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodDesc.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodDesc.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//            foodDesc.topAnchor.constraint(equalTo: foodMeal.bottomAnchor, constant: 13)
        ])
        
    }
    
    private func setupRoundedText() {
        roundedView.backgroundColor = UIColor.a3.light_red
        roundedView.layer.cornerRadius = 10
        
        contentView.addSubview(roundedView)
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.sendSubviewToBack(roundedView)

        
        NSLayoutConstraint.activate([
            roundedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            roundedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -200),
            roundedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 30),
            roundedView.widthAnchor.constraint(equalToConstant: 1),
            roundedView.heightAnchor.constraint(equalToConstant: 20),
                                   
            ])
    }
    
    
}
