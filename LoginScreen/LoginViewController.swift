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
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            welcomeVC.userName = userNameTF.text ?? ""
    }
    
    
    // MARK: - IBAction
    @IBAction func logInAction() {
        if verificationDate() {
            
        } else {
            alertDateAction()
        }
        
    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    // MARK: - Alerts
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
    
    @IBAction func alertForgotAction(_ sender: UIButton) {
        
        var message = ""
        switch sender.titleLabel?.text {
        case "Forgot User name?":
            message = "Your name: \(dateUser.userName.rawValue)"
        
        default:
            message = "Your name: \(dateUser.password.rawValue)"
        }
        let alertController = UIAlertController(
                title: "Oops! \u{1F615}",
                message: message,
                preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
        
        
    }
    
    //MARK: - work with keyboard
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTF:
            passwordTF.becomeFirstResponder()
        default:
            passwordTF.resignFirstResponder()
            if verificationDate() {
                performSegue(withIdentifier: "goToWelcomeVC", sender: self)
                    } else {
                        alertDateAction()
                    }
        }
        return true
    }
    // MARK: - private methods
    private func verificationDate() -> Bool {
        let user = userNameTF.text == dateUser.userName.rawValue
        let password = passwordTF.text == dateUser.password.rawValue
        
        return user && password
    }
}

extension LoginViewController: UITextFieldDelegate {
    
}

