//
//  ViewController.swift
//  editTheScenePopover
//
//  Created by ByteDance on 2022/7/11.
//

import UIKit

class ViewController: UIViewController {

    private let viewA: UIView = UIView()
    private let buttonA: UIButton = UIButton(type: UIButton.ButtonType.infoLight)
    private let buttonB: UIButton = UIButton(type: UIButton.ButtonType.infoDark)
    override func viewDidLoad() {
        super.viewDidLoad()
        //按钮
        buttonA.addTarget(self, action: #selector(buttonClicked(button:)), for: UIControl.Event.touchUpInside)
        view.addSubview(buttonA)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttonA.frame = CGRect(x: 150, y: view.safeAreaInsets.top + 300, width: 40, height: 40)
        buttonB.frame = CGRect(x: 100, y: view.safeAreaInsets.top + 200, width: 40, height: 40)
    }
    
    @objc private func buttonClicked(button: UIButton){
        let vc = EditScenePopupViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
}

