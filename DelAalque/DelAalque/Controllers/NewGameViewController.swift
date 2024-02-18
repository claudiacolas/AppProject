//
//  NewGameViewController.swift
//  DelAalque
//
//  Created by Anxi on 6/9/23.
//
//  User can create a new game
//

import UIKit

class NewGameViewController: UIViewController {
        
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var linkFriends: UIButton!
    @IBOutlet weak var gameName: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var doneButton: UIButton!
    
    let data = ["General", "Noms de persona", "Animals", "Menjar"]
    var selectedOption: String?
    var pickerViewTopConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Nova partida"
                
        gameName.delegate = self
        
        setSegmentedControlProperties()
        
        linkFriends.isHidden = true
        linkFriends.setTitle("Enllaça amics", for: .normal)
        
        setPickerViewProperties()
        
        doneButton.setTitle("T'atreveixes?", for: .normal)
        doneButton.layer.cornerRadius = 20
    }
    
    // Function that makes sure the correct appearence of the screen
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.appColor(.pink)
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        guard let gameNameText = gameName.text, !gameNameText.isEmpty else {
            let alertController = UIAlertController(title: "Ets un despistat!", message: "No t'oblidis de posar-li un nom a la teva partida.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Entesos", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        }
            
        performSegue(withIdentifier: K.Segue.newGameToGame, sender: gameNameText)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segue.newGameToGame {
            if let destinationVC = segue.destination as? GameViewController,
               let gameName = sender as? String {
                destinationVC.title = gameName
            }
        }
    }
    
}

// MARK: TextField

extension NewGameViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: PickerView

extension NewGameViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func setPickerViewProperties() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.layer.cornerRadius = 20
        pickerViewTopConstraint?.isActive = false
        pickerViewTopConstraint = pickerView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 50)
        pickerViewTopConstraint?.isActive = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    // Método del UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedOption = data[row]
        
    }
    
}

// MARK: SegmentedControl

extension NewGameViewController {
    
    func setSegmentedControlProperties() {
        let fontSize: CGFloat = 17.0
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)]
        segmentedControl.setTitleTextAttributes(fontAttributes, for: .normal)
        segmentedControl.setTitleTextAttributes(fontAttributes, for: .selected)
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            linkFriends.isHidden = false
            pickerViewTopConstraint?.isActive = false
            pickerViewTopConstraint = pickerView.topAnchor.constraint(equalTo: linkFriends.bottomAnchor, constant: 50)
            pickerViewTopConstraint?.isActive = true
        } else {
            linkFriends.isHidden = true
            pickerViewTopConstraint?.isActive = false
            pickerViewTopConstraint = pickerView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 50)
            pickerViewTopConstraint?.isActive = true
        }
    }
}
