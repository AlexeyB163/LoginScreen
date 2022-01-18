//
//  ViewController.swift
//  LoginScreen
//
//  Created by User on 29.12.2021.
//

import UIKit


class LoginViewController: UIViewController {

    //MARK: - outlets
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    //MARK: - private property
    private let user = User(person: Person(
            name: "Алексей",
            surname: "Бычинин",
            hobby: Hobby(description: "", hobbyImage: "enduro"),
            family: Family(iImage: "I", wife: "Таня", wifeImage: "tany",
                           childrenOne: "Егор", childrenOneImage: "egor",
                           childrenTwo: "Артем", childrenTwoImage: "tema",
                           pets: "Шкода", petsImage: "cat",
                           familyImage: "family"),
            work: Work(description: "",
                       workImage: "work"
                      )
                )
        )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let familyVC = navigationVC.topViewController as! MyFamilyViewController
                familyVC.user = user
            }
        }
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
        ? showAlert(title: "Oops! \u{1F615}", message: "Your name: \(user.nicName)")
        : showAlert(title: "Oops! \u{1F615}", message: "Your name: \(user.password)")
    }
    
    
    // MARK: - private methods
    private func verificationDate() -> Bool {
        let nicName = userNameTF.text == user.nicName
        let password = passwordTF.text == user.password
        return nicName && password
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

