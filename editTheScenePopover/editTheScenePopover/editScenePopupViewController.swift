//
//  editScenePopupViewController.swift
//  editTheScenePopover
//
//  Created by ByteDance on 2022/7/18.
//

import Foundation
import UIKit


let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
public class EditScenePopupViewController: UIViewController {
    private let closeButton = UIButton()
    private let popupImage = UIImageView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    let hotSpotMinX = screenWidth / 2 - 127.5
    let hotSpotMaxX = screenWidth / 2 + 127.5
    let hotSpotMinY = screenHeight / 2 - 186.5
    let hotSpotMaxY = screenHeight / 2 + 260.5
    
    public func setupUI() {
        view.backgroundColor = UIColor.init(white: 0x000000, alpha: 0.4)
        popupImage.frame = CGRect(x: screenWidth / 2 - 149.5, y: screenHeight / 2 - 226.5, width: 299, height: 453)
        popupImage.image = UIImage(named: "Image")
        view.addSubview(popupImage)
        
        let normalBtnHeight = screenHeight / 2 + 260.5
        if screenHeight - normalBtnHeight - 44 >= 50 {
            closeButton.frame = CGRect(x: screenWidth / 2 - 19.985, y: normalBtnHeight , width: 44, height: 44)
        } else {
            let spBtnWidth = screenWidth / 2 + 149.5 - 44
            let spBtnHeight = screenHeight / 2 - 226.5 - 44
            closeButton.frame = CGRect(x: spBtnWidth, y: spBtnHeight, width: 44, height: 44)
        }
        closeButton.setImage(UIImage(named: "ic_back_w"), for: .normal)
        closeButton.addTarget(self, action: #selector(onClose(_:)), for: .touchUpInside)
        view.addSubview(closeButton)
         
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //获取点击的坐标位置
        for touch: AnyObject in touches {
            let point = (touch as AnyObject).location(in: self.view)
            print("point \(point)")
            if point.x <= hotSpotMaxX && point.x >= hotSpotMinX,
               point.y <= hotSpotMaxY && point.y >= hotSpotMinY{
                dismiss(animated: true, completion: nil)
            } else {
                return
            }
        }
    }
    
    @objc private func onClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

