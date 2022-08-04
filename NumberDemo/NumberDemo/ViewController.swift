//
//  ViewController.swift
//  NumberDemo
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit

class ViewController: UIViewController {

    var intNumber: Int = 0
    var doubleNumber: Double = 0
    var step: Int = 1
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        label.numberOfLines = 0
        label.textAlignment = .center
    }

    @IBAction func clickButton(_ sender: UIButton) {
        intNumber += step
        doubleNumber += Double(step)
        
        if intNumber >= 10 || intNumber <= 0{
            step *= -1
        }
            updateUI()
    }
    func updateUI(){
        label.text = "Int: \(intNumber) \n Double: \(doubleNumber)"
        let title = step > 0 ? "+\(step)" : "\(step)"
        button.setTitle(title, for: .normal)
    }
    
}

