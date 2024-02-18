//
//  Awards.swift
//  DelAalque
//
//  Created by Anxi on 13/2/24.
//

import UIKit

struct Award {
    let name: String
    let image: UIImage
}

class AwardsDataManager {
    static let shared = AwardsDataManager()
    
    let options: [Award] = [
        Award(name: "Gran delaalquelista", image: UIImage(systemName: "globe.europe.africa.fill")!),
        Award(name: "Gran estudiant", image: UIImage(systemName: "graduationcap.circle.fill")!),
        Award(name: "Gran vocabulari", image: UIImage(systemName: "book.closed.circle.fill")!),
        Award(name: "Super velocitat", image: UIImage(systemName: "figure.run.circle.fill")!)
    ]
}
