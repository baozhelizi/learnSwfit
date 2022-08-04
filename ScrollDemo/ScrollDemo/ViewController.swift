//
//  ViewController.swift
//  ScrollDemo
//
//  Created by ByteDance on 2022/6/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imageView.frame = view.bounds
    }
    override func viewWillLayoutSubviews() {
        scrollView.zoomScale = 1
        scrollView.frame = view.bounds
        imageView.frame = view.bounds
    }

    @IBAction func tapImageView(_ sender: UITapGestureRecognizer) {
        let picker = UIImagePickerController()
        picker.delegate = self
        //跳转到相册
        present(picker, animated: true, completion: nil)
    }
    
}
extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //在相册中点击图片后，相册消失
        picker.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
    }
}
