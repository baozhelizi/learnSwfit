//
//  ViewController.swift
//  LoginDemo
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit

class ViewController: UIViewController {

    weak var errorLabel: UILabel!
    weak var usernameTextField: UITextField!
    weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(errorLabel)
        // Do any additional setup after loading the view.
        /*
        let label = UILabel(frame: CGRect(x: 80, y: 100, width: 50, height: 50))
        label.text = "Label"
        label.textColor = UIColor.red
        self.view.addSubview(label)
        
        let textfield = UITextField(frame: CGRect(x: 80, y: 150, width: 200, height: 40))
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "请输入账号"
        textfield.clearButtonMode = .always
        self.view.addSubview(textfield)
        
        let textfield2 = UITextField(frame: CGRect(x: 80, y: 200, width: 200, height: 40))
        textfield2.borderStyle = .roundedRect
        textfield2.placeholder = "请输入密码"
        textfield2.clearButtonMode = .always
        self.view.addSubview(textfield2)
        
        let btn = UIButton(frame: CGRect(x: 150, y: 250, width: 50, height: 40))
        btn.backgroundColor = UIColor.blue
        btn.setTitle("登录", for: .normal)
        self.view.addSubview(btn)
         */
    }


}

