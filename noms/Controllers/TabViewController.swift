//
//  TabViewController.swift
//  munch_3
//
//  Created by Angelina Chen on 4/28/24.
//

import Foundation
import UIKit

class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
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
}
