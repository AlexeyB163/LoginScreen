//
//  LogOutViewController.swift
//  LoginScreen
//
//  Created by User on 29.12.2021.
//

import UIKit



class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeUser: UILabel!
    
    @IBOutlet weak var imageUser: UIImageView!
    
    var userFirstName = ""
    private var userSurName = ""
    private var userIm = UIImage()
    
    private var greetingUser: String {
        return "Welcome" + " " + userFirstName + " " + userSurName + " " + "!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUser.text = greetingUser
        imageUser.image = userIm
        imageUser.layer.cornerRadius = 10
    }
}

extension WelcomeViewController {
    func setDataForWelcomeVC (name: String, surname: String) {
        userFirstName = name
        userSurName = surname
        userIm = UIImage(named: "I")!
    }
}
