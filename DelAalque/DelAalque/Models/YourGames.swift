//
//  YourGames.swift
//  DelAalque
//
//  Created by Anxi on 13/2/24.
//

import UIKit

struct YourGame {
    let title: String
    let users: [String]
    let image: UIImage
}

class YourGamesDataManager {
    static let shared = YourGamesDataManager()
    
    let options: [YourGame] = [
        YourGame(title: "Xaxipistaxi", users: ["AngelaGiribet", "ClaudiaColas"], image: UIImage(systemName: "theatermasks.fill")!),
        YourGame(title: "123", users: ["HaraldMelcher", "ClaudiaColas"], image: UIImage(systemName: "lamp.desk.fill")!),
        YourGame(title: "Let's go", users: ["AngelaGiribet", "HaraldMelcher"], image: UIImage(systemName: "popcorn.fill")!)
    ]
}

