//
//  ProfileViewController.swift
//  munch_3
//
//  Created by Angelina Chen on 4/28/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private var collectionView: UICollectionView!

    private let nameLabel = UILabel()
    private let profileImage = UIImageView()
    private let username = UILabel()
    private let allNoms = UILabel()
    private let foodImage = UIImageView()
    private let foodLabel = UILabel()
    private let foodImage2 = UIImageView()
    private let foodLabel2 = UILabel()
    private let phrase = UILabel()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupNameLabel()
        setupProfileImage()
        setupUsername()
        setupAllNoms()
        setupFoodImage()
        setupFoodLabel()
        setupFoodImage2()
        setupFoodLabel2()
        setupPhrase()
    }
    
    // MARK: - Set Up Views
    
    private func setupNameLabel() {
        nameLabel.text = "Bill Nye"
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel.textColor = UIColor.a3.coral

        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
//            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupUsername() {
        username.text = "bill.nye"
        username.font = .systemFont(ofSize: 20, weight: .medium)
        username.textColor = UIColor.lightGray
        
        view.addSubview(username)
        username.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 15),
            username.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupPhrase() {
        phrase.text = "Always cheffin' it up!"
        phrase.font = .systemFont(ofSize: 12, weight: .medium)
        phrase.textColor = UIColor.lightGray
        
        view.addSubview(phrase)
        phrase.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            phrase.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 5),
            phrase.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupProfileImage() {
        // profileImage.scaleAspectFit = true
        profileImage.image = UIImage(named: "bill_nye")
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 87
        
        view.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 167),
            // profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            profileImage.widthAnchor.constraint(equalToConstant: 180),
            profileImage.heightAnchor.constraint(equalToConstant: 180),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupAllNoms() {
        allNoms.text = "All Noms"
        allNoms.font = .systemFont(ofSize: 18, weight: .bold)
        allNoms.textColor = UIColor.black
        
        view.addSubview(allNoms)
        allNoms.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            allNoms.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 60),
            allNoms.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
    }
    
    private func setupFoodImage() {
        // profileImage.scaleAspectFit = true
        foodImage.image = UIImage(named: "vegetable_lasagna")
        foodImage.layer.masksToBounds = true
        foodImage.layer.cornerRadius = 10
        
        view.addSubview(foodImage)
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodImage.topAnchor.constraint(equalTo: allNoms.bottomAnchor, constant: 25),
            // profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            foodImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            foodImage.widthAnchor.constraint(equalToConstant: 150),
            foodImage.heightAnchor.constraint(equalToConstant: 150),
//            foodImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupFoodLabel() {
        foodLabel.text = "Vegetable Lasagna"
        foodLabel.font = .systemFont(ofSize: 13, weight: .medium)
        foodLabel.textColor = UIColor.a3.coral
        
        view.addSubview(foodLabel)
        foodLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodLabel.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 10),
            foodLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45)
        ])
    }
    
    private func setupFoodImage2() {
        // profileImage.scaleAspectFit = true
        foodImage2.image = UIImage(named: "quinoa_salad")
        foodImage2.layer.masksToBounds = true
        foodImage2.layer.cornerRadius = 10
        
        view.addSubview(foodImage2)
        foodImage2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodImage2.topAnchor.constraint(equalTo: allNoms.bottomAnchor, constant: 25),
            // profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            foodImage2.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor, constant: 30),
            foodImage2.widthAnchor.constraint(equalToConstant: 150),
            foodImage2.heightAnchor.constraint(equalToConstant: 150),
//            foodImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupFoodLabel2() {
        foodLabel2.text = "Quinoa Salad"
        foodLabel2.font = .systemFont(ofSize: 13, weight: .medium)
        foodLabel2.textColor = UIColor.a3.coral
        
        view.addSubview(foodLabel2)
        foodLabel2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodLabel2.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 10),
            foodLabel2.leadingAnchor.constraint(equalTo: foodLabel.trailingAnchor, constant: 80)
        ])
    }


}

// MARK: - UICollectionViewDelegate

//extension ProfileViewController: UICollectionViewDelegate { }
//
//// MARK: - UICollectionViewDataSource
//
//extension ProfileViewController: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return noms.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SavedCollectionViewCell.reuse, for: indexPath) as? SavedCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//
////        cell.redButton.tag = indexPath.row
////        cell.redButton.addTarget(self,action: #selector(self.pushProfile),
////            for: .touchUpInside)
//
//        cell.configure(nom: noms[indexPath.row])
//
//        return cell
//    }
////
////    @objc private func pushProfile() {
////        let ProfilePostViewController = ProfilePostViewController()
////
////        self.navigationController?.pushViewController(ProfilePostViewController, animated: true)
////    }
////
//
//}
//
//extension ProfileViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let size = collectionView.frame.width
//        return CGSize(width: size, height: 160)
//    }
//
//}


