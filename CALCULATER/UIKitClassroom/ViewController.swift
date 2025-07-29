//
//  ViewController.swift
//  UIKitClassroom
//
//  Created by Krish Bahukhandi on 15/07/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var universityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTap(_ sender: UIButton) {
        print("Button is Tapped")
        universityLabel.text = "Ios Programmer"
    }

}

