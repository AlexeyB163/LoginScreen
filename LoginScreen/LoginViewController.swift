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
        self.view.endEditing(true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if verificationDate() {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            welcomeVC.userName = userNameTF.text ?? ""
        } else {
            alertDateAction()
        }
    }
    
    
    // MARK: - IBAction
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let loginVC = segue.source as? WelcomeViewController else { return }
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotUserAction() {
        alerForgotUser()
    }
    
    @IBAction func forgotPasswordAction() {
        alertForgotPassword()
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
    
    func alerForgotUser() {
        let alertController = UIAlertController(
            title: "Oops! \u{1F615}",
            message: "Your name: \(dateUser.userName.rawValue)",
            preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    func alertForgotPassword() {
        let alertController = UIAlertController(
            title: "Oops! \u{1F615}",
            message: "Your password: \(dateUser.password.rawValue)",
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
        case passwordTF:
            passwordTF.resignFirstResponder()
            if verificationDate() {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let nextVC = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
                        nextVC.userName = userNameTF.text ?? ""
                        self.present(nextVC, animated: true, completion: nil)
                    } else {
                        alertDateAction()
                    }
        default:
            break
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

