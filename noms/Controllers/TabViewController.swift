//
//  TabViewController.swift
//  munch_3
//
//  Created by Angelina Chen on 4/28/24.
//

import Foundation
import UIKit

class TabViewController: UITabBarController {
    
    let fabButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor.a3.coral
        setupTabs()
        setupFAB()
    }
    
    private func setupTabs() {
        let homeVC = ViewController()
        let planVC = PlanViewController()
        let profileVC = ProfileViewController()
        let savedVC = SavedViewController()
        
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        planVC.tabBarItem = UITabBarItem(title: "Plan", image: UIImage(systemName: "calendar"), tag: 1)
        savedVC.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "bookmark"), tag: 2)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
        
        self.setViewControllers([homeVC, planVC, savedVC, profileVC], animated: true)
    }
    
    private func setupFAB() {
        fabButton.frame = CGRect(x: 0, y: 0, width: 56, height: 56)
        fabButton.backgroundColor = UIColor.a3.coral
        fabButton.setImage(UIImage(systemName: "plus"), for: .normal)
        fabButton.tintColor = UIColor.white
        
        fabButton.layer.cornerRadius = fabButton.frame.height / 2
        fabButton.layer.masksToBounds = true
        
        fabButton.layer.shadowColor = UIColor.black.cgColor
        fabButton.layer.shadowOpacity = 0.5
        fabButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        fabButton.layer.shadowRadius = 2

        // Position the button at the bottom-right of the view
        fabButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fabButton)

        NSLayoutConstraint.activate([
            fabButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            fabButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -88),
            fabButton.widthAnchor.constraint(equalToConstant: 56),
            fabButton.heightAnchor.constraint(equalToConstant: 56)
        ])

        // Add action
//        fabButton.addTarget(self, action: #selector(fabTapped), for: .touchUpInside)
    }
    
}
