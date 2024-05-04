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
    private var collectionView: UICollectionView!

//    private weak var delegate: UpdateTextDelegate?
//    private weak var delegate2: UpdateTextDelegate?
    
    // MARK: - Properties (data)
    
    private var profile_posts: [Profile_Post] = [
        Profile_Post(name: "Greek Yogurt Parfait", image: "parfait", meal: "Breakfast", description: "Creamy Greek yogurt layered with fresh fruits and crunchy granola."),
        Profile_Post(name: "Tomato Soup with Grilled Cheese", image: "tomato_soup", meal: "Lunch", description: "Crafted with thinly sliced tender beef and rice noodles."),
        Profile_Post(name: "Beef Stir-Fry", image: "beef_stirfry", meal: "Dinner", description: "Food")
    ]
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupCollectionView()
        setupNameLabel()
    }
    
    // MARK: - Set Up Views
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 100
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    private func setupNameLabel() {
        nameLabel.text = "emily.thomas554"
//        nameLabel.font = .systemFont(ofSize: 24)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textColor = UIColor.black


        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    

}

// MARK: - UICollectionViewDelegate Delegate

extension ProfilePostViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegate DataSource

extension ProfilePostViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profile_posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.reuse, for: indexPath) as? ProfileCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(profilePost: profile_posts[indexPath.row])
        
        return cell
    }
    
    
    
    
}


// MARK: - UICollectionViewDelegateFlowLayout

extension ProfilePostViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width
        return CGSize(width: size, height: size + 25)
    }
    
}


