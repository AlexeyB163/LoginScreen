//
//  ViewController.swift
//  LoginScreen
//
//  Created by User on 29.12.2021.
//

import UIKit

enum dateUser: String {
    case userName = "User"
    case password = "1234"
}


class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.delegate = self
        
    }
    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if verificationDate() {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            welcomeVC.userName = userNameTF.text ?? ""
        } else {
            alertDateAction()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }

    
    @IBAction func forgotUserAction() {
        alerForgotUser()
    }
    
    @IBAction func forgotPasswordAction() {
        alertForgotPassword()
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let loginVC = segue.source as? WelcomeViewController else { return }
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    func alertDateAction() {
        let alertController  = UIAlertController(
            title: "Invalid login or password",
            message: "Please, enter correct login and password",
            preferredStyle: .alert)
        
        let alertAction = UIAlertAction(
            title: "OK",
            style: .default)
            { _ in self.passwordTF.text = "" }
        
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    func alerForgotUser() {
        let alertController = UIAlertController(title: "Oops! \u{1F615}", message: "Your name: \(dateUser.userName.rawValue)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
    
    func alertForgotPassword() {
        let alertController = UIAlertController(title: "Oops! \u{1F615}", message: "Your password: \(dateUser.password.rawValue)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTF.resignFirstResponder()
        
        return true
    }
    
    private func verificationDate() -> Bool {
        let user = userNameTF.text == dateUser.userName.rawValue
        let password = passwordTF.text == dateUser.password.rawValue
        
        return user && password
    }
    
   
}

extension LoginViewController: UITextFieldDelegate {
    
}

