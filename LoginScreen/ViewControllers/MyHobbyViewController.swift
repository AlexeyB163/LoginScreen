//
//  MyHobbyViewController.swift
//  LoginScreen
//
//  Created by User on 10.01.2022.
//

import UIKit

class MyHobbyViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var hobbyDisriptLabel: UILabel!
    @IBOutlet weak var hobbyImage: UIImageView!
    
    // MARK: - Property
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDataInMyHobbyVC()
        hobbyImage.layer.cornerRadius = 10

    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let workVC = segue.destination as? MyWorkViewController else { return }
        workVC.user = self.user
    }

}
    // MARK: - Extension
extension MyHobbyViewController {
    func setDataInMyHobbyVC() {
        hobbyDisriptLabel.text = "Люблю мотоциклы 🏍 -  hard enduro 🤘"
        hobbyImage.image = UIImage(named: "\(user.person.hobby.hobbyImage)")
        
    }
}
