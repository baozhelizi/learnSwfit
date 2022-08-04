//
//  ViewController.swift
//  UIViewText
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        
/*      //标签的使用
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        label.backgroundColor = UIColor.gray
        self.view.addSubview(label)
        /*
        label.text = "这是一段文本，非常非常长，阿哈哈哈"
        //多行显示
        label.numberOfLines = 0
        //更改字体
        label.font = UIFont.systemFont(ofSize: 20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        //对齐方式 居中
        label.textAlignment = .center
        //阴影
        label.shadowColor = UIColor.white
        label.shadowOffset = CGSize(width: 2, height: 2)
         */
        
        //富文本
        let str = NSMutableAttributedString(string: "富文本富文本富文本")
        //动态的添加属性
        str.addAttribute(.font, value: UIFont.systemFont(ofSize: 10), range: NSRange(location: 3, length: 3))
        str.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 3, length: 3))
        str.addAttribute(.backgroundColor, value: UIColor.blue, range: NSRange(location: 3, length: 3))
        str.addAttribute(.underlineColor, value: UIColor.yellow, range: NSRange(location: 0, length: 3))
        str.addAttribute(.underlineStyle, value: 2, range: NSRange(location: 0, length: 3))
        
        //同时设置多个
        //str.addAttributes([], range: <#T##NSRange#>)
        label.attributedText = str
        
        //label.attributedText = NSAttributedString(string: "wenben", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13)])
 */
    
 
/*
    //显示图像
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        imageView.image = UIImage(named: "pic")
        self.view.addSubview(imageView)
        
    //加载一组图片
        imageView.animationImages = [UIImage(named: "pic")!, UIImage(named: "pic-1")!, UIImage(named: "pic2")!]
    //持续时间
        imageView.animationDuration = 2
    //重复次数
        imageView.animationRepeatCount = 0
    //开始播放
        imageView.startAnimating()
 */
       
        

/*
        //按钮和点击事件
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        btn.backgroundColor = UIColor.gray
        btn.setTitle("点击", for: .normal)
        btn.setTitle("点到了", for: .highlighted)
        btn.setTitle("不能点", for: .disabled)
        btn.isEnabled = true
        //btn.setImage(UIImage(named: "pic"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "test"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        btn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.view.addSubview(btn)
    }

    //所有事件方法@objc
    @objc func buttonClick(){
        print("被点击了")
    }
 */
   
        
        
        let textField = UITextField(frame: CGRect(x: 50, y: 100, width: 200, height: 40))
        //textField.backgroundColor = UIColor.gray
        textField.borderStyle = .roundedRect
        //占位符
        textField.placeholder = "请输入账号"
        textField.textColor = UIColor.red
        //对齐方式
        textField.textAlignment = .center
        //背景图片
        //textField.background = UIImage(named: "pic")
        //清空按钮
        textField.clearButtonMode = .always
        //左侧或右侧添加自定义view
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view1.backgroundColor = UIColor.gray
        textField.leftView = view1
        textField.leftViewMode = .always
        self.view.addSubview(textField)
        //textfied有很多回调方法，通过代理方式传给我们
        textField.delegate = self
    }
    
    //点击了清除按钮
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    //点击确定按钮
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //失去焦点
        textField.resignFirstResponder()
        return true
    }
    //将要进入编辑模式
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("将要编辑")
        return true
    }
    //已经进入编辑模式
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("开始编辑")
    }
    //将要退出编辑
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("将要退出")
        return true
    }
    //已经退出编辑
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("已经退出")
    }
    //将要改变内容
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("将要改变内容")
        return true
    }
    //已经改变内容
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("已经改变")
    }
}

