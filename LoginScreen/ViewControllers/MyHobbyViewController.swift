//
//  MyHobbyViewController.swift
//  LoginScreen
//
//  Created by User on 10.01.2022.
//

import UIKit

class MyHobbyViewController: UIViewController {

    @IBOutlet weak var hobbyDisriptLabel: UILabel!
    @IBOutlet weak var hobbyImage: UIImageView!
    
    var hobbyDiscription = ""
    var hobbyIm = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hobbyDisriptLabel.text = hobbyDiscription
        hobbyImage.image = hobbyIm

        
    }

}

extension MyHobbyViewController {
    func setDataInMyHobbyVC() {
        hobbyDiscription = "Люблю мотоциклы 🏍 -  hard enduro 🤘"
        hobbyIm = UIImage(named: "enduro")!
        
    }
}
