//
//  GameViewController.swift
//  DelAalque
//
//  Created by Anxi on 18/10/2023.
//
//  Screen where user plays
//

import UIKit

class GameViewController: UIViewController {
            
    // When user wants a hint
    @IBOutlet weak var pledgeButton: UIButton!
    
    // When user doesn't want to or isn't able to continue playing
    @IBOutlet weak var givingUpButton: UIButton!
    
    @IBOutlet weak var writeYourNextWord: UILabel!
    @IBOutlet weak var lastWordTitle: UILabel!
    @IBOutlet weak var lastWord: UILabel!
    @IBOutlet weak var letter: UILabel!
    @IBOutlet weak var backgroundLetter: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    var randomLetter: Character = "A"
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        textField.delegate = self
        
        lastWordTitle.text = "Última paraula"
        
        lastWord.text = "..."
        
        backgroundLetter.layer.cornerRadius = 20
        
        writeYourNextWord.text = "Escriu la teva propera paraula"
        
        pledgeButton.setTitle("Penyora", for: .normal)
        pledgeButton.layer.cornerRadius = 30
        
        givingUpButton.setTitle("Em rendeixo", for: .normal)
        givingUpButton.layer.cornerRadius = 30
        
        generateRandomLetter()
        updateLetterOutlet()
        machinePlay()
    }
    
    func generateRandomLetter() {
        let alphabet = "ABCÇDEFGHIJKLMNOPQRSTUVWXYZ"
        if let randomChar = alphabet.randomElement() {
            randomLetter = randomChar
        }
    }

    func updateLetterOutlet() {
        letter.text = String(randomLetter)
    }
    
    func machinePlay() {
        
    }
        
    // Function that makes sure the correct appearence of the screen
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = true
        tabBarController?.tabBar.isHidden = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.appColor(.lightPurple)
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
}

// MARK: TextField

extension GameViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard var inputWord = textField.text?.uppercased() else {
            textField.resignFirstResponder()
            return true
        }
        
        let originalInputWord = inputWord
        
        // Remove diacritic from first letter in the word
        if let firstChar = inputWord.first {
            let firstCharWithoutDiacritic = String(firstChar).folding(options: .diacriticInsensitive, locale: .current)
            inputWord.removeFirst()
            inputWord = firstCharWithoutDiacritic + inputWord
        }

        // Check if first letter is the same as randomLetter
        if let firstChar = inputWord.first, firstChar == randomLetter {
            lastWord.text = originalInputWord // Mostrar la palabra original
            let lastCharWithoutDiacritic = String(originalInputWord.last ?? Character("")).folding(options: .diacriticInsensitive, locale: .current)
            randomLetter = lastCharWithoutDiacritic.first ?? randomLetter
            updateLetterOutlet()
        } else {
            let alertController = UIAlertController(title: "Torna-ho a intentar", message: "La paraula no comença amb la lletra correcta.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Tu pots!", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }

        textField.text = "" // Neteja el camp de text
        textField.resignFirstResponder() // Amaga el teclat
        return true
    }
    
}

// MARK: Buttons

extension GameViewController {
    
    // Function that Giving Up button and returns the user to Home
    @IBAction func givingUpButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "N'estàs segur?", message: "Si et rendeixes, perdràs la partida.", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Tornar a la partida", style: .cancel, handler: nil))
            
        alertController.addAction(UIAlertAction(title: "Em rendeixo", style: .destructive, handler: { (_) in
            if let homeViewController =
                self.navigationController?.viewControllers.first(where: { $0 is HomeViewController }) {
                self.navigationController?.popToViewController(homeViewController, animated: true)
            }
        }))
        
        
        present(alertController, animated: true, completion: nil)
    }
    
    // Function that handles the Closing button and returns the user to Home
    @IBAction func closeButtonPressed(_ sender: UIBarButtonItem) {
        if let homeViewController =
            navigationController?.viewControllers.first(where: { $0 is HomeViewController }) {
            navigationController?.popToViewController(homeViewController, animated: true)
        }
    }
    
    // Function that handles the Pledge button
    
}

