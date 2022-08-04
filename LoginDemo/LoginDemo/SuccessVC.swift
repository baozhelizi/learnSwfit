//
//  SuccessVC.swift
//  LoginDemo
//
//  Created by ByteDance on 2022/6/13.
//

import UIKit

class SuccessVC: UIViewController {

    var text: String = ""
    
    weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = text
    }
    
    func clickExitButton(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
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
