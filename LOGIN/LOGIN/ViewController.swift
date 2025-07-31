//
//  ViewController.swift
//  LOGIN
//
//  Created by Krish Bahukhandi on 31/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var ForgetUsernameTap: UIButton!
    @IBOutlet weak var ForgetPasswordTap: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        if sender == ForgetUsernameTap {
            segue.destination.title = "Forget Username"
        }
        else if sender == ForgetPasswordTap {
            segue.destination.title = "Forget Password"
        }
        else{
            segue.destination.title = Username.text
        }
    }
    @IBAction func ForgetPassword(_ sender: Any) {
        performSegue(withIdentifier: "Forgot", sender: sender)
    }
    
    @IBAction func ForgetUserName(_ sender: Any) {
        performSegue(withIdentifier: "Forgot", sender: sender)
    }
}

