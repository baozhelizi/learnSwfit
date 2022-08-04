//
//  RegisterVCViewController.swift
//  LoginDemo
//
//  Created by ByteDance on 2022/6/13.
//

import UIKit

class RegisterVCViewController: UIViewController {

    weak var errorLabel: UILabel!
    weak var usernameTextField: UITextField!
    weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(errorLabel)
    }
    func clickLoginButton(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
