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
    private var collectionView: UICollectionView!
    private let pageLabel = UILabel()
    
    // MARK: - Properties (data)
    private var noms: [Nom] = [
        Nom(name: "Avocado Toast", image: "avocado_toast", meal: "Breakfast", description: "Made with thick sliced whole grain, topped with perfectly ripe avocado mashed to creamy perfection."),
        Nom(name: "Beef Stif-fry", image: "beef_stirfry", meal: "Dinner", description: "A sizzling concoction of tender beef strips and vibrant vegetables, stir-fried to perfection."),
        Nom(name: "Banana Pancakes", image: "banana_pancakes", meal: "Breakfast", description: "Fluffy pancakes with banana flavor, topped with syrup and butter."),
        Nom(name: "Vegetable Lasagna", image: "vegetable_lasagna", meal: "Lunch", description: "Layers of pasta, veggies, and cheese, baked until bubbly."),
        Nom(name: "Sesame Bagel", image: "sesame_bagel", meal: "Breakfast", description: "A classic bagel coated with sesame seeds for a crunchy exterior. Perfect for spreading with your favorite cream cheese or  toppings."),
        Nom(name: "Pho", image: "food_image", meal: "Lunch", description: "Crafted with thinly sliced tender beef and rice noodles, simmered in a rich, aromatic broth."),

    ]
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupPageLabel()
        setupCollectionView()
    }
    
    // MARK: - Set Up Views
    
    
    private func setupPageLabel() {
        pageLabel.text = "Saved Noms"
        pageLabel.font = UIFont.boldSystemFont(ofSize: 24)
        pageLabel.textColor = UIColor.a3.coral
        
        view.addSubview(pageLabel)
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            pageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            munchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
//        layout.minimumInteritemSpacing = 30
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SavedCollectionViewCell.self, forCellWithReuseIdentifier: SavedCollectionViewCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.white
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            collectionView.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
}

// MARK: - UICollectionViewDelegate

extension SavedViewController: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension SavedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SavedCollectionViewCell.reuse, for: indexPath) as? SavedCollectionViewCell else {
            return UICollectionViewCell()
        }
        
//        cell.redButton.tag = indexPath.row
//        cell.redButton.addTarget(self,action: #selector(self.pushProfile),
//            for: .touchUpInside)
        
        cell.configure(nom: noms[indexPath.row])
        
        return cell
    }
//    
//    @objc private func pushProfile() {
//        let ProfilePostViewController = ProfilePostViewController()
//                                             
//        self.navigationController?.pushViewController(ProfilePostViewController, animated: true)
//    }
//
    
}

extension SavedViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = collectionView.frame.width
        return CGSize(width: size, height: 160)
    }

}

