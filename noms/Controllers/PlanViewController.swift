//
//  PlanViewController.swift
//  noms
//
//  Created by Tiffany Lee on 5/2/24.
//

import Foundation
import UIKit

class PlanViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private let nameLabel = UILabel()
    private let phraseLabel = UILabel()
    private let monthLabel = UILabel()
    private let burgerImage = UIImageView()
    private var collectionView: UICollectionView!
    private var collectionView2: UICollectionView!

    
    private var calendar: [Calendar] = [
        Calendar(date: "5", weekday: "Sun"),
        Calendar(date: "6", weekday: "Mon"),
        Calendar(date: "7", weekday: "Tue"),
        Calendar(date: "8", weekday: "Wed"),
        Calendar(date: "9", weekday: "Thu"),
        Calendar(date: "10", weekday: "Fri"),
        Calendar(date: "11", weekday: "Sat"),
    ]
    
    private var date_posts: [Nom] = [
        Nom(name: "Avocado Toast", image: "food_image", meal: "Breakfast", description: "Made with thick sliced whole grain, topped with perfectly ripe avocado mashed to creamy perfection."),
        Nom(name: "Pho", image: "food_image", meal: "Breakfast", description: "Crafted with thinly sliced tender beef and rice noodles, simmered in a rich, aromatic broth infused with traditional Vietnamese spices."),
        Nom(name: "Caesar Salad", image: "food_image", meal: "Lunch", description: "This was really good"),
        Nom(name: "Avocado Toast", image: "food_image", meal: "Breakfast", description: "Made with thick sliced whole grain, topped with perfectly ripe avocado mashed to creamy perfection."),
    ]
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupNameLabel()
        setupPhraseLabel()
        setupBurgerImage()
        setupMonthLabel()
        
        setupCollectionView()
        setupCollectionView2()
    }
    
    // MARK: - Set Up Views
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 100
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            collectionView.heightAnchor.constraint(equalToConstant: 50)
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupCollectionView2() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 100
        
        collectionView2 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView2.register(PlanCollectionViewCell.self, forCellWithReuseIdentifier: PlanCollectionViewCell.reuse)
        collectionView2.delegate = self
        collectionView2.dataSource = self
        
        view.addSubview(collectionView2)
        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView2.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 23),
            collectionView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            collectionView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
//            collectionView2.heightAnchor.constraint(equalToConstant: 50)
            collectionView2.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupPhraseLabel() {
        phraseLabel.text = "Plan your perfect plate."
        phraseLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        phraseLabel.textColor = UIColor.gray
        
        view.addSubview(phraseLabel)
        phraseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            phraseLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            phraseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
    }
    
    private func setupNameLabel() {
        nameLabel.text = "Your Meal Plan"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textColor = UIColor.a3.coral

        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            munchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupBurgerImage() {
        burgerImage.image = UIImage(named: "burger")
        
        view.addSubview(burgerImage)
        burgerImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            burgerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 167),
            burgerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            burgerImage.widthAnchor.constraint(equalToConstant: 40),
            burgerImage.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupMonthLabel() {
        monthLabel.text = "May"
        monthLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        monthLabel.textColor = UIColor.black

        view.addSubview(monthLabel)
        monthLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 174),
            monthLabel.leadingAnchor.constraint(equalTo: burgerImage.trailingAnchor, constant: 5),
//            munchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    

}


// MARK: - UICollectionViewDelegate Delegate

extension PlanViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegate DataSource

extension PlanViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView2 {
            return date_posts.count
        } else {
            return calendar.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == collectionView2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanCollectionViewCell.reuse, for: indexPath) as? PlanCollectionViewCell else {
                return UICollectionViewCell()
            }

            cell.configure(nom: date_posts[indexPath.item])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.reuse, for: indexPath) as? CalendarCollectionViewCell else {
                return UICollectionViewCell()
            }

            cell.configure(calendar: calendar[indexPath.item])
            return cell
        }
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.reuse, for: indexPath) as? CalendarCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//
//        cell.configure(calendar: calendar[indexPath.row])
//
//        return cell
    }
    
    
    
    
}


// MARK: - UICollectionViewDelegateFlowLayout

extension PlanViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionView2 {
            let size = collectionView.frame.width
            return CGSize(width: size, height: 160)
        } else {
            let size = collectionView.frame.width / 8
            return CGSize(width: size, height: size)
        }
    }
    
}


