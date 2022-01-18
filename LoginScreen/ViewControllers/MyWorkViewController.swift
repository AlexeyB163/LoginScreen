//
//  MyWorkViewController.swift
//  LoginScreen
//
//  Created by User on 10.01.2022.
//

import UIKit

class MyWorkViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var workDiscriptLabel: UILabel!
    @IBOutlet weak var workImage: UIImageView!
    
    // MARK: - Property
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDataInMyWorkVC()
        workImage.layer.cornerRadius = 10
    }

}
    // MARK: - Extension
extension MyWorkViewController {
    func setDataInMyWorkVC() {
        workDiscriptLabel.text = "магазин канцтоваров - КанцМир"
        workImage.image = UIImage(named: "work")!
        
    }
}
