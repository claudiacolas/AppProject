//
//  HomeViewController.swift
//  DelAalque
//
//  Created by Anxi on 6/9/23.
//
//  Home screen where user can resume started games or create a new one
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var yourGames: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Inici"
        newGameButton.setTitle("Nova partida", for: .normal)
        newGameButton.layer.cornerRadius = 20
        yourGames.text = "Les teves partides"
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // Function that makes sure the appearence of the screen
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.appColor(.orange)
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        tabBarController?.tabBar.isHidden = false
        tabBarController?.tabBar.tintColor = UIColor.appColor(.orange)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return YourGamesDataManager.shared.options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ReusableCell.reusableCellYourGame, for: indexPath) as! YourGameCell
        let yourGame = YourGamesDataManager.shared.options[indexPath.item]
        cell.title.text = yourGame.title
        cell.users.text = yourGame.users.joined(separator: ", ")
        cell.topImage.image = yourGame.image
        cell.continueGame.setTitle("Continuar", for: .normal)
        
        if indexPath.item != 0 {
            let separatorView = UIView(frame: CGRect(x: cell.bounds.width - 1, y: 0, width: 1, height: cell.bounds.height))
            separatorView.backgroundColor = UIColor.lightGray
            cell.addSubview(separatorView)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yourGame = YourGamesDataManager.shared.options[indexPath.item]
        let gameNameText = yourGame.title
        print("Cell was selected: \(gameNameText)")
        performSegue(withIdentifier: K.Segue.homeToGame, sender: gameNameText)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segue.homeToGame {
            if let destinationVC = segue.destination as? GameViewController,
               let gameName = sender as? String {
                destinationVC.title = gameName
            }
        }
    }

}
