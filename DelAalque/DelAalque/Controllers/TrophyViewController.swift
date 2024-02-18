//
//  TrophyViewController.swift
//  DelAalque
//
//  Created by Anxi on 6/9/23.
//
//  User can have a look at the awards their had earned throughout all their games
//

import UIKit

class TrophyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Premis"
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // Function that makes sure the appearence of the screen
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.appColor(.purple)
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        tabBarController?.tabBar.isHidden = false
        tabBarController?.tabBar.tintColor = UIColor.appColor(.purple)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AwardsDataManager.shared.options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ReusableCell.reusableCellAward, for: indexPath) as! AwardCell
        let award = AwardsDataManager.shared.options[indexPath.item]
        cell.label.text = award.name
        cell.topImage.image = award.image
        return cell
    }
    
}
