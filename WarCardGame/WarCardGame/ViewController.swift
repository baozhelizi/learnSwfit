//
//  ViewController.swift
//  WarCardGame
//
//  Created by ByteDance on 2022/6/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var left: UIImageView!
    @IBOutlet weak var right: UIImageView!
    @IBOutlet weak var leftScore: UILabel!
    @IBOutlet weak var rightScore: UILabel!

    var leftS = 0
    var rightS = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func dealTapped(_ sender: Any) {
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        left.image = UIImage(named: "card\(leftNumber)")
        right.image = UIImage(named: "card\(rightNumber)")
        
        
        if leftNumber > rightNumber{
            leftS += 1
            leftScore.text = String(leftS)
        }else if leftNumber < rightNumber{
            rightS += 1
            rightScore.text = String(rightS)
        }else{
    
        }

    }
    
}

