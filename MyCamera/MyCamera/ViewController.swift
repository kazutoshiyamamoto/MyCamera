//
//  ViewController.swift
//  MyCamera
//
//  Created by home on 2018/01/27.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var pictureImage: UIImageView!
    
    // カメラを起動するボタンをタップすると実行
    @IBAction func cameraButtonAction(_ sender: Any) {
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("カメラは利用できます")
            // （１）UIImagePickerControllerのインスタンスを生成
            let ipc = UIImagePickerController()
            // （２）sourceTypeにCameraを設定
            ipc.sourceType = .camera
            // （３）deligate設置
            ipc.delegate = self
            // （４）モーダルビューで表示
            present(ipc, animated: true, completion: nil)
        }else{
            print("カメラが利用できません")
        }
    }
    
    //SNSに投稿するボタンをタップすると実行
    @IBAction func SNSButtonAction(_ sender: Any) {
        
    // （１）撮影が終わった時に呼ばれるdeligateメソッド
        func UIImagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
          // （２）撮影した写真を、配置したpictureImageに渡す
          pictureImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
          // （３）モーダルニューを閉じる
          dismiss(animated: true, completion: nil)
            
    // 表示画像をアンラップしてシェア画像として取り出し
        if let shareImage = pictureImage.image {
          // UIActivityViewControllerに渡す配列を作成
          let shareItems = [shareImage]
                
          //UIActivityViewControllerにシェア画像を渡す
          let Controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            
          // iPadで落ちてしまう対策
          Controller.popoverPresentationController?.sourceView = view
            
          //UIActivityViewControllerを表示
          present(Controller, animated: true, completion: nil)
            
            }
            
        }
    }
    
    
    
}

