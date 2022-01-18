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
    
    var user: User!
    
    private var fullName: String {
        user.person.name + " " + user.person.surname
    }
    
    private var userIm = UIImage()
    
    private var greetingUser: String {
        return "Welcome" + " " + fullName + "!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDataForWelcomeVC()
        imageUser.image = userIm
        imageUser.layer.cornerRadius = 10
    }
}

extension WelcomeViewController {
    
    func setDataForWelcomeVC () {
        welcomeUser.text = greetingUser
        userIm = UIImage(named: "\(user.person.family.iImage)")!
    }
}
