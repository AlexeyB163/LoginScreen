//
//  ViewController.swift
//  LoginScreen
//
//  Created by User on 29.12.2021.
//

import UIKit


class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            welcomeVC.userName = userNameTF.text ?? ""
    }
    
    
    // MARK: - IBAction
    @IBAction func logInAction() {
        guard verificationDate() else {
            showAlert(
            title: "Invalid login or password",
            message: "Please, enter correct login and password",
            textField: passwordTF)
            return
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    


    @IBAction func alertForgotAction(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops! \u{1F615}", message: "Your name: \(dateUser.userName.rawValue)")
        : showAlert(title: "Oops! \u{1F615}", message: "Your name: \(dateUser.password.rawValue)")
    }
    
    
    // MARK: - private methods
    private func verificationDate() -> Bool {
        let user = userNameTF.text == dateUser.userName.rawValue
        let password = passwordTF.text == dateUser.password.rawValue
        
        return user && password
    }
}
// MARK: - Alerts

extension LoginViewController {
    
    private func showAlert (title: String, message: String, textField: UITextField? = nil ) {
        let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
            
        }
        alertcontroller.addAction(alertAction)
        present(alertcontroller, animated: true)
    }
}
//MARK: - work with keyboard

extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInAction()
            performSegue(withIdentifier: "goToWelcomeVC", sender: self)
        }
        return true
    }
}

