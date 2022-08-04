//
//  EditScenePopupManager.swift
//  editTheScenePopover
//
//  Created by ByteDance on 2022/7/20.
//

import Foundation
import UIKit

//private var enterPosition: Enter
public class EditScenePopupManager {
    public func showPopupIfNeed() {
        if check(imcId: EnterAlbumVCPosition.exportPageAgain.rawValue) {
//        if check(imcId: enterPosition()) {   enterVCSource.enterPosition().rawValue

            showPopup()
        }
    }

    private func check(imcId: String) -> Bool {
        if imcId.isEmpty {
            return false
        }
        var showTimes = 0
        let times: Int = 2
//        let startTime = "2022/07/20 00:00:00"
//        let endTime = "2022/08/20 00:00:00"
//        let date = Date().timeIntervalSince1970
//        guard startTime < endTime, date > startTime, date < endTime else {
//            return false
//        }
        if times < 1 {
            return false
        }
        if times >= showTimes {
            showTimes += 1
            return true
        }
    }

    private func showPopup() {
        let vc = EditScenePopupViewController()
        UIViewController.ibaseTopViewController?.present(vc, animated: true, completion: nil)
    }
}

public enum EnterAlbumVCPosition: String {
    case homepageUpper = "homepage_upper"       // 首页上方功能栏
    case exportPageIcon = "export_page_icon"    // 导出页上方功能栏
    case exportPageAgain = "export_page_again"  // 导出页再修一张按钮
    case homepageFeed = "homepage_recommend"    // 首页模板推荐
    case homepageSearch = "homepage_search"     // 首页搜索
    case feed = "feed"                          // 模板feed
    case feedSearch = "template_feed_search"    // 模板feed搜索
    case multiShare = "multi_share"             // 多图分享
    case other = ""
}

public extension UIViewController {
    
    static var ibaseTopViewController: UIViewController? {
        var _window: UIWindow? = UIApplication.shared.delegate?.window ?? nil
        if _window?.isKind(of: UIView.self) != true {
            _window = UIApplication.shared.keyWindow
        }
        let _topView = _window?.subviews.last
        guard let topVc = ibaseTopViewController(forResponder: _topView) else {
            return nil
        }
        if let navVc = topVc as? UINavigationController {
            return navVc.topViewController
        }
        return topVc
    }
    
    static var ibaseTopNavigationViewController: UINavigationController? {
        guard let _topViewController = ibaseTopViewController else {
            return nil
        }
        if let _presented = _topViewController.presentedViewController, let _navigation = _presented as? UINavigationController {
            return _navigation
        } else if let _navigation = _topViewController as? UINavigationController {
            return _navigation
        } else if let _navigation = _topViewController.navigationController {
            return _navigation
        } else if let _tabBarViewController = _topViewController as? UITabBarController,
            let _selectViewController = _tabBarViewController.selectedViewController as? UINavigationController {
            return _selectViewController
        }
        return nil
    }
    
    static func ibaseTopViewController(forResponder responder: UIResponder?) -> UIViewController? {
        var _responder = responder
        while _responder != nil {
            if let vc = _responder as? UIViewController {
                var _viewController: UIViewController? = vc
                while (_viewController?.parent != nil &&
                    _viewController?.parent != _viewController?.navigationController &&
                    _viewController?.parent != _viewController?.tabBarController) {
                        _viewController = _viewController?.parent
                }
                return _viewController
            }
            _responder = _responder?.next
        }
        
        if _responder == nil, let _window = UIApplication.shared.delegate?.window, let rootVc = _window?.rootViewController {
            _responder = rootVc
        }

        var viewController = _responder as? UIViewController
        while viewController?.presentedViewController != nil, viewController?.presentedViewController?.isBeingDismissed != true {
            viewController = viewController?.presentedViewController
        }
        return viewController
    }
}

