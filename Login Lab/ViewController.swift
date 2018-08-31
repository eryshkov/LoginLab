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
        
        userNameTextField.delegate = self
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
            var ac = UIAlertController(title: "Warning", message: "Enter User Name please", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            ac.addAction(action)
            present(ac, animated: true)
            return
        }
        
        performSegue(withIdentifier: "LogIn", sender: userName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? SecondViewController else {return}
        
        guard let segueID = segue.identifier else { return }
        
        switch segueID {
        case "LogIn":
            if let userName = sender as? String {
                dvc.textToDisplay = "Hi \(userName)."
            }
        case "FogotPW":
            dvc.textToDisplay = "Forgot password."
        case "ForgotUN":
            dvc.textToDisplay = "Forgot User Name."
        default:
            break
        }
        
    }
}

// MARK: - Delegate Extentions
extension ViewController: UITextFieldDelegate{
    // Hides keyboard on RETURN Button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.resignFirstResponder()
        return true
    }
    // Hides keyboard on Touch Outside Tap
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
}





