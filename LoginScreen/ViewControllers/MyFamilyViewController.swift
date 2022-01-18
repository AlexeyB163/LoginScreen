//
//  MyFamilyViewController.swift
//  LoginScreen
//
//  Created by User on 10.01.2022.
//

import UIKit

class MyFamilyViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var familyDiscripLabel: UILabel!
    @IBOutlet weak var wifeLabel: UILabel!
    @IBOutlet weak var childOneLabel: UILabel!
    @IBOutlet weak var childTwoLabel: UILabel!
    @IBOutlet weak var petLabel: UILabel!
    
    
    @IBOutlet weak var wifeImage: UIImageView!
    @IBOutlet weak var childOneImage: UIImageView!
    @IBOutlet weak var childTwoImage: UIImageView!
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var familyFotoImage: UIImageView!
    
    // MARK: - Property
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      setDataInFamilyVC()
      wifeImage.layer.cornerRadius = 10
      childOneImage.layer.cornerRadius = 10
      childTwoImage.layer.cornerRadius = 10
      petImage.layer.cornerRadius = 10
      familyFotoImage.layer.cornerRadius = 10
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let hobbyVC = segue.destination as? MyHobbyViewController else { return }
        hobbyVC.user = self.user
        
    }

}
    // MARK: - Extension
extension MyFamilyViewController {
    func setDataInFamilyVC(){
        familyDiscripLabel.text = "Это моя дружная семья!"
        wifeLabel.text = user.person.family.wife
        wifeImage.image = UIImage(named: "\(user.person.family.wifeImage)")
        childOneLabel.text = user.person.family.childrenOne
        childOneImage.image = UIImage(named: "\(user.person.family.childrenOneImage)")
        childTwoLabel.text = user.person.family.childrenTwo
        childTwoImage.image = UIImage(named: "\(user.person.family.childrenTwoImage)")
        petLabel.text = user.person.family.pets
        petImage.image = UIImage(named: "\(user.person.family.petsImage)")
        familyFotoImage.image = UIImage(named: "\(user.person.family.familyImage)")
    }
}
