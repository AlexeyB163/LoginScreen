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
    
    var userName = ""
    
    private var greetingUser: String {
        return "Welcome" + " " + userName + " " + "!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUser.text = greetingUser
        imageUser.image = UIImage(named: "user")
        imageUser.layer.cornerRadius = imageUser.layer.frame.height/2
    }
}
