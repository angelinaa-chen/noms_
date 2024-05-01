//
//  CollectionViewCell.swift
//  munch_3
//
//  Created by Angelina Chen on 4/28/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private var post: Post?
    private let profileImage = UIImageView()
    private let profileName = UILabel()
    private let date = UILabel()
    private let foodImage = UIImageView()
    private let foodImage2 = UIImageView()
    private let heartButton = UIButton()
    private let savedButton = UIButton()
    private let redButton = UIButton()
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    let imageView = UIImageView()
    
    private var collectionView: UICollectionView!

    
    static let reuse = "CollectionViewCellReuse"
    
    private var posts: [Post] = [
        Post(name: "Bob", images: ["food_image", "food_image", "food_image"]),
        Post(name: "Bobby", images: ["food_image", "food_image", "food_image"]),
        Post(name: "Boby", images: ["food_image", "food_image", "food_image"])
    ]
    
    // MARK: ini
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        setupCollectionView()
        
        setupProfileImage()
        setupNameLabel()
//        setupFoodImage()
//        setupFoodImage2()
//        setupHeartButton()
//        setupSaveButton()
        setupDate()
        setupRedArrow()
        
//        setupScrollView()
//        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 100
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCollectionViewCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        contentView.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    // MARK: - configure

    func configure(with post: Post!) {
        self.post = post
        profileName.text = post.name
        collectionView.reloadData()

    
//        for image in post.images {
//
//            let image = UIImageView(image: UIImage(named: image))
//                image.contentMode = .scaleAspectFit
//                image.layer.masksToBounds = true
//                image.layer.cornerRadius = 0
//                image.translatesAutoresizingMaskIntoConstraints = false
//                stackView.addArrangedSubview(image)
//
//            NSLayoutConstraint.activate([
//                image.widthAnchor.constraint(equalToConstant: 140),
//                image.topAnchor.constraint(equalTo: scrollView.topAnchor),
//                image.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//                image.heightAnchor.constraint(equalToConstant: 140)
//            ])
//
//
//            let recipeLabel = UILabel()
//            recipeLabel.text = "Recipe"
//            recipeLabel.textColor = .black
//            // recipeLabel.textAlignment = .center
//            recipeLabel.font = UIFont.systemFont(ofSize: 14)
//            recipeLabel.translatesAutoresizingMaskIntoConstraints = false
//            stackView.addArrangedSubview(recipeLabel)
////
//            NSLayoutConstraint.activate([
////                recipeLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -22),
//                recipeLabel.topAnchor.constraint(equalTo: image.topAnchor, constant: 186),
//            ])
//
//            let likeButton = UIButton()
//            likeButton.setImage(UIImage(named: "unliked_heart"), for: .normal)
//            likeButton.addTarget(self, action: #selector(heartUp), for: .touchUpInside)
//            likeButton.translatesAutoresizingMaskIntoConstraints = false
//            stackView.addSubview(likeButton)
//
//            NSLayoutConstraint.activate([
//                likeButton.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -22),
//                likeButton.topAnchor.constraint(equalTo: image.topAnchor, constant: 186),
//                likeButton.widthAnchor.constraint(equalToConstant: 15),
//                likeButton.heightAnchor.constraint(equalToConstant: 15)
//            ])
//
//            let saveButton = UIButton()
//            saveButton.setImage(UIImage(named: "bookmark_unfilled"), for: .normal)
//            saveButton.addTarget(self, action: #selector(savedPost), for: .touchUpInside)
//            saveButton.translatesAutoresizingMaskIntoConstraints = false
//            image.addSubview(saveButton)
//
//            NSLayoutConstraint.activate([
//                saveButton.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -3),
//                saveButton.topAnchor.constraint(equalTo: image.topAnchor, constant: 187),
//                saveButton.widthAnchor.constraint(equalToConstant: 14.5),
//                saveButton.heightAnchor.constraint(equalToConstant: 13)
//            ])
//
//        }
    }
    
    private func setupScrollView() {
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(scrollView)
            
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: profileImage.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
        
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
            
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    private func setupProfileImage() {
        profileImage.image = UIImage(named: "anonymous_image")
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius =  20
        
        contentView.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 38),
            profileImage.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    
    private func setupNameLabel() {
        profileName.text = "Anonymous"
        profileName.textColor = UIColor.black
        profileName.font = .systemFont(ofSize:15, weight: .medium)
        
        contentView.addSubview(profileName)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            profileName.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 4)
        ])
    }
    
    private func setupDate() {
        date.text = "7 hours ago"
        date.textColor = UIColor.lightGray
        date.font = .systemFont(ofSize: 12, weight: .medium)
        
        contentView.addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            date.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            date.topAnchor.constraint(equalTo: profileName.bottomAnchor)
        ])
        
    }
    
    private func setupFoodImage() {
        foodImage.layer.masksToBounds = true
        foodImage.layer.cornerRadius = 16
        foodImage.image = UIImage(named: "food_image")
        // foodImage.contentMode = .scaleAspectFit

        contentView.addSubview(foodImage)
        foodImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            foodImage.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            foodImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            // foodImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            foodImage.widthAnchor.constraint(equalToConstant: 150),
            foodImage.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupFoodImage2() {
        foodImage2.layer.masksToBounds = true
        foodImage2.layer.cornerRadius = 16
        foodImage2.image = UIImage(named: "food_image")
        // foodImage.contentMode = .scaleAspectFit

        
        
        contentView.addSubview(foodImage2)
        foodImage2.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            foodImage2.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            // foodImage2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodImage2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            foodImage2.widthAnchor.constraint(equalToConstant: 150),
            foodImage2.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupHeartButton() {
        let unliked_heart = UIImage(named: "unliked_heart")
        heartButton.backgroundColor = UIColor.white
        heartButton.setImage(unliked_heart, for: .normal)
        heartButton.addTarget(self, action: #selector(heartUp), for: .touchUpInside)
        
        contentView.addSubview(heartButton)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            heartButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            heartButton.widthAnchor.constraint(equalToConstant: 18),
            heartButton.heightAnchor.constraint(equalToConstant: 18)
        ])
        
    }
    
    private func setupSaveButton() {
        let unfilled_bookmark = UIImage(named: "bookmark_unfilled")
        savedButton.backgroundColor = UIColor.white
        savedButton.setImage(unfilled_bookmark, for: .normal)
        savedButton.addTarget(self, action: #selector(savedPost), for: .touchUpInside)
        
        contentView.addSubview(savedButton)
        savedButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            savedButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            savedButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            savedButton.widthAnchor.constraint(equalToConstant: 18),
            savedButton.heightAnchor.constraint(equalToConstant: 17)
        ])
        
    }
    
    private func setupRedArrow() {
        let red_Button = UIImage(named: "red_arrow")
        redButton.backgroundColor = UIColor.white
        redButton.setImage(red_Button, for: .normal)
        
        contentView.addSubview(redButton)
        redButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            redButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            redButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            redButton.widthAnchor.constraint(equalToConstant: 22),
            redButton.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    @objc private func heartUp() {
        self.heartButton.setImage(UIImage(named: "liked_heart3"), for: .normal)
        }
    
    @objc private func savedPost() {
        self.savedButton.setImage(UIImage(named: "bookmark_filled"), for: .normal)
    }
    
}

// MARK: - UICollectionView Delegate

extension CollectionViewCell: UICollectionViewDelegate {

}

// MARK: - UICollectionView DataSource

extension CollectionViewCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.reuse, for: indexPath) as? HorizontalCollectionViewCell, let imageName = post?.images[indexPath.item] else {
                    return UICollectionViewCell()
                }
                cell.configure(UIImage(named: imageName))
            return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CollectionViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = collectionView.frame.width / 2.4
        return CGSize(width: size, height: size * 1.25)
    }

}


