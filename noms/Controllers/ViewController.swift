//
//  ViewController.swift
//  munch_3
//
//  Created by Angelina Chen on 4/28/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties (view)

    private var collectionView: UICollectionView!
    private let munchLabel = UILabel()
    private let subTitle = UILabel()
    
    
    // MARK: - Properties (data)
    private var posts: [Post] = [
        Post(name: "walkerwhite1110", images: ["avocado_toast", "caesar_salad", "vegetarian_chili"]),
        Post(name: "emily.thomas554", images: ["parfait", "tomato_soup", "beef_stirfry"]),
        Post(name: "alexcheese7", images: ["banana_pancakes", "quinoa_salad", "baked_salmon"]),
        Post(name: "jane_doe", images: ["sesame_bagel", "vegetable_lasagna", "beef_bourguignon"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white

        setupCollectionView()
        setupTitleLabel()
        setupSubTitle()
        
    }
    
    private func setupSubTitle() {
        subTitle.text = "See what's cookin'"
        subTitle.font = UIFont.boldSystemFont(ofSize: 14)
        subTitle.textColor = UIColor.lightGray
        
        view.addSubview(subTitle)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: munchLabel.bottomAnchor, constant: 3),
            subTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

        ])
    }
    private func setupTitleLabel() {
        munchLabel.text = "Today's Feed"
        munchLabel.font = UIFont.boldSystemFont(ofSize: 24)
        munchLabel.textColor = UIColor.a3.coral
        
        view.addSubview(munchLabel)
        munchLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            munchLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -5),
            munchLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            munchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = -10
        layout.minimumInteritemSpacing = 30
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }

}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuse, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.redButton.tag = indexPath.row
        cell.redButton.addTarget(self,action: #selector(self.pushProfile),
            for: .touchUpInside)
        
        cell.configure(with:posts[indexPath.row])
        
        return cell
    }
    
    @objc private func pushProfile() {
        let ProfilePostViewController = ProfilePostViewController()
                                             
        self.navigationController?.pushViewController(ProfilePostViewController, animated: true)
    }
    
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = collectionView.frame.width
        return CGSize(width: size, height: size * 0.8)
    }

}

