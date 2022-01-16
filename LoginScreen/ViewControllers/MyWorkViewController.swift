//
//  MyWorkViewController.swift
//  LoginScreen
//
//  Created by User on 10.01.2022.
//

import UIKit

class MyWorkViewController: UIViewController {

    @IBOutlet weak var workDiscriptLabel: UILabel!
    
    @IBOutlet weak var workImage: UIImageView!
    
    private var workDiscription = ""
    private var workIm = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        workDiscriptLabel.text = workDiscription
        workImage.image = workIm
    }

}

extension MyWorkViewController {
    func setDataInMyWorkVC() {
        workDiscription = "магазин канцтоваров - КанцМир"
        workIm = UIImage(named: "work")!
        
    }
}
