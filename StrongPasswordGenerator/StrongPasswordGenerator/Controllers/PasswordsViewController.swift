//
//  PasswordsViewController.swift
//  StrongPasswordGenerator
//
//  Created by Gabriel Henrique Santos Pereira on 26/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {
    @IBOutlet weak var textViewPasswords: UITextView!
    
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        
        generatePasswords()
    }
    
    func generatePasswords() {
        /** First we scroll our TextView to the 0 point location */
        textViewPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        
        /** Before we generate the passwords, we clear our TextView to prevent the accumulation of passwords generated */
        textViewPasswords.text = ""
        
        /** Then we generate an array of passwords using our model PasswordGenerator */
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        
        /** To finish, we iterate over our array of passwords and append each one of the array items inside the TextView */
        for password in passwords {
            print(password)
            
            textViewPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func actionGenerate(_ sender: UIButton) {
        generatePasswords()
    }
}
