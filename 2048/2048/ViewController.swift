//
//  ViewController.swift
//  2048
//
//  Created by ByteDance on 2022/6/15.
//

import UIKit

class ViewController: UIViewController, GameViewDelegate {
    
    var gameView: GameView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func looseAction() {
        let alert = UIAlertController(title: "你输了", message: "所有空格都满了", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "再来一局", style: .cancel) { (_) in self.restart() }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    @objc func restart() {
        self.gameView?.removeSave()
        self.gameView?.startGame()
    }
    
    func setup() {
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        let appearance = NormalAppearance()
        
        self.view.backgroundColor = appearance.backgroundColor()
        self.gameView = GameView(frame: frame, size: 4, appearance: appearance)
        self.gameView!.delegate = self
        self.gameView!.center = self.view.center
        self.view.addSubview(gameView!)
        
        let restartButton = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 187, height: 34)))
        restartButton.center = CGPoint(x: self.view.center.x, y: self.view.center.y + self.view.frame.height/2 - 50)
        restartButton.backgroundColor = .white
        restartButton.layer.cornerRadius = 10
        restartButton.setTitle("再来一局", for: .normal)
        restartButton.setTitleColor(.black, for: .normal)
        restartButton.titleLabel?.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .medium)
        restartButton.layer.shadowColor = UIColor.black.cgColor
        restartButton.layer.shadowOffset = CGSize(width: 0, height: 8.0)
        restartButton.layer.shadowOpacity = 0.15
        restartButton.layer.shadowRadius = 8.0
        restartButton.addTarget(self, action: #selector(restart), for: .touchUpInside)
        
        self.view.addSubview(restartButton)
    }
}

