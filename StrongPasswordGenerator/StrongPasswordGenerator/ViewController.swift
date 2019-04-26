//
//  ViewController.swift
//  StrongPasswordGenerator
//
//  Created by Gabriel Henrique Santos Pereira on 26/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldTotalPasswords: UITextField!
    @IBOutlet weak var textFieldNumberOfCharacters: UITextField!
    @IBOutlet weak var switchLetters: UISwitch!
    @IBOutlet weak var switchNumbers: UISwitch!
    @IBOutlet weak var switchCapitalLetters: UISwitch!
    @IBOutlet weak var switchSpecialCharacters: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController
        
        if let numberOfPasswords = Int(textFieldTotalPasswords.text!) {
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        
        if let numberOfCharacters = Int(textFieldNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        
        passwordsViewController.useLetters = switchLetters.isOn
        passwordsViewController.useNumbers = switchNumbers.isOn
        passwordsViewController.useCapitalLetters = switchCapitalLetters.isOn
        passwordsViewController.useSpecialCharacters = switchSpecialCharacters.isOn
        
        /** This method will close the active keyboard and remove the focus from any TextField  */
        view.endEditing(true)
    }
}

