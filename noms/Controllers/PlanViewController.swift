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
    private let monthLabel = UILabel()
    private let burgerImage = UIImageView()
    private var collectionView: UICollectionView!

    
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
        Nom(name: "Avocado Toast", image: "food_image", meal: "Breakfast", description: "This was really good"),
        Nom(name: "French Toast", image: "food_image", meal: "Breakfast", description: "This was really good"),
        Nom(name: "Caesar Salad", image: "food_image", meal: "Lunch", description: "This was really good")
    ]
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupNameLabel()
        setupBurgerImage()
        setupMonthLabel()
        
        setupCollectionView()
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
            collectionView.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            collectionView.heightAnchor.constraint(equalToConstant: 50)
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupNameLabel() {
        nameLabel.text = "Your Munch Plan"
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
            burgerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
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
            monthLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 157),
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
        return calendar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.reuse, for: indexPath) as? CalendarCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(calendar: calendar[indexPath.row])
        
        return cell
    }
    
    
    
    
}


// MARK: - UICollectionViewDelegateFlowLayout

extension PlanViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width / 8
        return CGSize(width: size, height: size)
    }
    
}


