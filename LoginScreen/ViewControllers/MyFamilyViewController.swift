//
//  MyFamilyViewController.swift
//  LoginScreen
//
//  Created by User on 10.01.2022.
//

import UIKit

class MyFamilyViewController: UIViewController {

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
    
    private let descriptionFamily = "Это моя дружная семья!"
    private var wifeName = ""
    private var childOneName = ""
    private var childTwoName = ""
    private var petName = ""
    
    private var wifeIm = UIImage()
    private var childOneIm = UIImage()
    private var childTwoIm = UIImage()
    private var petIm = UIImage()
    private var familyIm = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        familyDiscripLabel.text = descriptionFamily
        wifeLabel.text = wifeName
        childOneLabel.text = childOneName
        childTwoLabel.text = childTwoName
        petLabel.text = petName
        
        wifeImage.image = wifeIm
        wifeImage.layer.cornerRadius = 10
        childOneImage.image = childOneIm
        childOneImage.layer.cornerRadius = 10
        childTwoImage.image = childTwoIm
        childTwoImage.layer.cornerRadius = 10
        petImage.image = petIm
        petImage.layer.cornerRadius = 10
        familyFotoImage.image = familyIm
        familyFotoImage.layer.cornerRadius = 10
    }

}

extension MyFamilyViewController {
    func setDataInFamilyVC(userFamily: [Family]){
        for member in userFamily {
            if member.wife == "Таня" {
                wifeName = member.wife
                wifeIm = UIImage(named: "tany")!
                }
            if !member.pets.isEmpty {
                petName = member.pets
                petIm = UIImage(named: "cat")!
            }
            if member.childrenOne == "Егор" {
                childOneName = member.childrenOne
                childOneIm = UIImage(named: "egor")!
            }
            if member.childrenTwo == "Артем"{
                childTwoName = member.childrenTwo
                childTwoIm = UIImage(named: "tema")!
            }
        }
        familyIm = UIImage(named: "family")!
    }
}
