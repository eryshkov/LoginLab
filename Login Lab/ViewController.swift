//
//  ViewController.swift
//  Login Lab
//
//  Created by Evgeniy Ryshkov on 31.08.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBActions
    @IBAction func forgotButtonUNTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ForgotUN", sender: nil)
    }
    
    @IBAction func forgotPassButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "FogotPW", sender: nil)
    }
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        guard var userName = userNameTextField.text else { return }
        
        userName = userName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !userName.isEmpty else {
            return
        }
        
        performSegue(withIdentifier: "LogIn", sender: userName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? SecondViewController else { return }
        
        switch segue.identifier! {
        case "LogIn":
            if let userName = sender as? String {
                dvc.label.text = "Hi \(userName)."
            }
        case "FogotPW":
            dvc.label.text = "Forgot password."
        case "ForgotUN":
            dvc.label.text = "Forgot User Name."
        default:
            break
        }
        
    }
}







