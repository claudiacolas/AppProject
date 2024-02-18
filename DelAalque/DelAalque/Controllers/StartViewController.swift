//
//  StartViewController.swift
//  DelAalque
//
//  Created by Anxi on 6/9/23.
//
//  Login or Register
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.setTitle("Inicia sessió", for: .normal)
        registerButton.setTitle("Registra't", for: .normal)
    }
    
}
