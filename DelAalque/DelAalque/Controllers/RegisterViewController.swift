//
//  RegisterViewController.swift
//  DelAalque
//
//  Created by Anxi on 6/9/23.
//
//  User registers a new account
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneButton: UIButton!
    
    var list: [IntroduceData] = DataRegistration.shared.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Registra't"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "IntroduceDataCell", bundle: nil), forCellReuseIdentifier: "IntroduceDataReusableCell")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        tableView.addGestureRecognizer(tapGesture)
        
        doneButton.setTitle("Benvingut!", for: .normal)
        doneButton.layer.cornerRadius = 20
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

extension RegisterViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IntroduceDataReusableCell", for: indexPath) as! IntroduceDataCell
        cell.titleData.text = list[indexPath.row].titleData
        cell.introduceData.placeholder = list[indexPath.row].textFieldText
        cell.introduceData.isSecureTextEntry = list[indexPath.row].secretTyping
        cell.selectionStyle = .none
        return cell
    }

}
