//
//  IntroduceData.swift
//  DelAalque
//
//  Created by Anxi on 29/11/23.
//

import Foundation

struct IntroduceData {
    let titleData: String
    let textFieldText: String
    let secretTyping: Bool
}

class DataLogin {
    
    static let shared = DataLogin()
    
    let list: [IntroduceData] = [
        IntroduceData(titleData: "Nom d'usuari o correu electrònic", textFieldText: "correu@electronic.cat", secretTyping: false),
        IntroduceData(titleData: "Contrasenya", textFieldText: "**********", secretTyping: true)
    ]

}

class DataRegistration {
    
    static let shared = DataRegistration()

    let list: [IntroduceData] = [
        IntroduceData(titleData: "Nom d'usuari", textFieldText: "@nomusuari", secretTyping: false),
        IntroduceData(titleData: "Correu electrònic", textFieldText: "correu@electronic.cat", secretTyping: false),
        IntroduceData(titleData: "Contrasenya", textFieldText: "**********", secretTyping: true),
        IntroduceData(titleData: "Confirma contrasenya", textFieldText: "**********", secretTyping: true)
    ]
}
