//
//  ViewController.swift
//  MyCamera
//
//  Created by 加古原　冬弥 on 2020/05/11.
//  Copyright © 2020 加古原　冬弥. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var pictureImage: UIImageView!
    
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        
        //カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            print("カメラは利用できます")
            
            //(1)UIImagePickerController()のインスタンスを作成
            let imagePickerController = UIImagePickerController()
            
            //(2)sourceType にcameraを設定
            imagePickerController.sourceType = .camera
            
            //(3)delegate設定
            imagePickerController.delegate = self
            
            //(4)モーダルビューで表示
            present(imagePickerController, animated: true, completion: nil)
        }else {
            print("カメラは利用できません")
        }
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
    }
    
    //(1)撮影が終わった時に呼ばれるderegateメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //(2)撮影した画像を配置したpictureImageに渡す
        pictureImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        //(3)モーダルビューを閉じる
        dismiss(animated: true, completion: nil)
    }
}

