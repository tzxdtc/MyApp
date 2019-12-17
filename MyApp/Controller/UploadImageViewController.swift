//
//  UploadImageViewController.swift
//  MyApp
//
//  Created by Zhixiang Tan on 2019/12/15.
//  Copyright © 2019 ZhixiangTan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import BSImagePicker
import Photos

class UploadImageViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    var SelectedAssets = [PHAsset]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectImage(_ sender: Any) {
        let vc = BSImagePickerViewController()
        self.bs_presentImagePickerController(vc, animated: true,
                                             select: {(asset: PHAsset)  -> Void in
                                                
                                             },
                                             deselect: {(asset: PHAsset)  -> Void in
                                                                                     
                                             },
                                             cancel: {(assets: [PHAsset])  -> Void in
                                                                                     
                                             },
                                             finish: {(assets: [PHAsset])  -> Void in
                                                for i in 0..<assets.count
                                                {
                                                    self.SelectedAssets.append(assets[i])
                                                
                                                }
                                                self.convertAssetToImages()
                                                                                     
                                             },
                                             completion: nil)
    }
    
    func convertAssetToImages() -> Void {
        let storage = Storage.storage()
        let storageRef = storage.reference(forURL: "gs://valued-visitor-244309.appspot.com")
        if SelectedAssets.count != 0 {
            for i in 0..<SelectedAssets.count{
                let manager = PHImageManager.default()
                let option = PHImageRequestOptions()
                var thumbnail = UIImage()
                option.isSynchronous = true
                
                manager.requestImage(for: SelectedAssets[i], targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: option) { (result, info) in
                    thumbnail = result!
                }
                
                let data = thumbnail.jpegData(compressionQuality: 0.7)
                if let newImage = UIImage(data: data!)?.pngData(){
                    let reference = storageRef.child("image/\(i+1).jpg")
                    reference.putData(newImage, metadata: nil) { (metaData, error) in
                        print("metaData",metaData)
                        print("error",error)
                    }
                }
 
            }
        }
    }
}
