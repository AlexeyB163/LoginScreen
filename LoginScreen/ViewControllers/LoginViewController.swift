//
//  ViewController.swift
//  LoginScreen
//
//  Created by User on 29.12.2021.
//

import UIKit


class LoginViewController: UIViewController {

    let user = User(person: Person(
        name: "Алексей",
        surname: "Бычинин",
        hobby: Hobby(description: "", hobbyImage: UIImage()),
        family: Family(wife: "Таня", wifeImage: UIImage(),
                       childrenOne: "Егор", childrenOneImage: UIImage(),
                       childrenTwo: "Артем", childrenTwoImage: UIImage(),
                       pets: "Шкода", petsImage: UIImage(),
                       familyImage: UIImage()),
        work: Work(description: "Магазин канцтоваров КанцМир",
                   workImage: UIImage()
                  )
        )
    )
    
    
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        let tabBarController = segue.destination as! UITabBarController
        
        for viewControllers in tabBarController.viewControllers! {
            if let welcomeVC = viewControllers as? WelcomeViewController {
                welcomeVC.setDataForWelcomeVC(name: user.person.name, surname: user.person.surname)
            } else if let navigationVC = viewControllers as? UINavigationController {
                let familyVC = navigationVC.topViewController as! MyFamilyViewController
                familyVC.setDataInFamilyVC(userFamily: [user.person.family])

                if let hobbyVC = storyboard?.instantiateViewController(withIdentifier: "hobbyVC") as? MyHobbyViewController {
                    hobbyVC.setDataInMyHobbyVC()
                }
                if let workVC = storyboard?.instantiateViewController(withIdentifier: "workVC") as? MyWorkViewController {
                    workVC.setDataInMyWorkVC()
                }
                }
            }
        }
        
            //welcomeVC.userName = userNameTF.text ?? ""
    
    
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

