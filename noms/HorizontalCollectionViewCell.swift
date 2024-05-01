//
//  HorizontalCollectionViewCell.swift
//  munch_3
//
//  Created by Angelina Chen on 4/29/24.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    static let reuse = "HorizontalCollectionViewCellReuse"
    
    private let foodImage: UIImageView = {
        let foodImage = UIImageView()
        foodImage.contentMode = .scaleAspectFill
        foodImage.layer.cornerRadius = 16
        foodImage.clipsToBounds = true
        return foodImage
    }()
    
    private let heartButton = UIButton()
    private let savedButton = UIButton()
    private let foodLabel = UILabel()
    private let mealLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFoodImage()
        setupHeartButton()
        setupSavedButton()
        setupFoodLabel()
        setupMealLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMealLabel() {
        mealLabel.text = "Dinner"
        mealLabel.textColor = UIColor.lightGray
        mealLabel.font = .systemFont(ofSize:10, weight: .medium)
        
        contentView.addSubview(mealLabel)
        mealLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mealLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            mealLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 50),
            mealLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
        ])
    }

    private func setupFoodLabel() {
        foodLabel.text = "Fried Rice"
        foodLabel.textColor = UIColor.black
        foodLabel.font = .systemFont(ofSize:12, weight: .medium)
        
        contentView.addSubview(foodLabel)
        foodLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            foodLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 50),
            foodLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
        ])
    }
        
    private func setupFoodImage() {
        addSubview(foodImage)
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            foodImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            foodImage.topAnchor.constraint(equalTo: topAnchor),
            foodImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
    }
    
    func configure(_ image: UIImage?) {
        foodImage.image = image
    }
    
    private func setupHeartButton() {
        let unliked_heart = UIImage(named: "unliked_heart")
        heartButton.backgroundColor = UIColor.white
        heartButton.setImage(unliked_heart, for: .normal)
        heartButton.addTarget(self, action: #selector(heartUp), for: .touchUpInside)
        
        contentView.addSubview(heartButton)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            heartButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1.75),
            heartButton.widthAnchor.constraint(equalToConstant: 17),
            heartButton.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
    
    private func setupSavedButton() {
        let unfilled_bookmark = UIImage(named: "bookmark_unfilled")
        savedButton.backgroundColor = UIColor.white
        savedButton.setImage(unfilled_bookmark, for: .normal)
        savedButton.addTarget(self, action: #selector(savedPost), for: .touchUpInside)
        
        contentView.addSubview(savedButton)
        savedButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            savedButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            savedButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            savedButton.widthAnchor.constraint(equalToConstant: 16),
            savedButton.heightAnchor.constraint(equalToConstant: 15)
        ])
        
    }
    
    @objc private func heartUp() {
        self.heartButton.setImage(UIImage(named: "liked_heart3"), for: .normal)
        }
    
    @objc private func savedPost() {
        self.savedButton.setImage(UIImage(named: "bookmark_filled"), for: .normal)
    }

}

