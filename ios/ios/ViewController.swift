//
//  ViewController.swift
//  ios
//
//  Created by ByteDance on 2022/6/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view
        //修改背景颜色
        self.view.backgroundColor = UIColor.red
        
        //UIView 视图类
        let view1 = UIView()
        //设置该视图在父视图中的位置和宽高
        view1.backgroundColor = UIColor.white
        view1.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        //中心
        view1.center = CGPoint(x: 100, y: 100)
        //把view1添加到view上，作为子视图存在
        self.view.addSubview(view1)
        
        let view2 = UIView(frame: CGRect(x: 130, y: 130, width: 100, height: 100))
        view2.self.backgroundColor = UIColor.blue
        self.view.addSubview(view2)
        
        //一个父视图可以包含很多子视图
        print(self.view.subviews.count)
        //把view1放到最上层
        self.view.bringSubviewToFront(view1)
        //把view1放到最下层
        self.view.sendSubviewToBack(view1)
        //交换两个子视图
        self.view.exchangeSubview(at: 0, withSubviewAt: 1)
        //把view2放到某个索引位置
        self.view.insertSubview(view2, at: 0)
        //把view2放到view1上面
        self.view.insertSubview(view2, aboveSubview: view1)
    }


}

