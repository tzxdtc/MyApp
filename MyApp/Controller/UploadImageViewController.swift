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
import FirebaseFirestore
import BSImagePicker
import Photos
import ImageSlideshow

class UploadImageViewController:UIViewController{
    
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    var SelectedAssets = [PHAsset]()
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image1 = UIImage(named: "1") else { return }
        guard let image2 = UIImage(named: "americaVisa") else { return }
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UploadImageViewController.didTap))
        slideshow.addGestureRecognizer(gestureRecognizer)
        slideshow.setImageInputs([
            ImageSource(image: image1),
            ImageSource(image: image2)
        ])
        print(Auth.auth().currentUser?.displayName)
        // Do any additional setup after loading the view.
    }
    
    @objc func didTap() {
      slideshow.presentFullScreenController(from: self)
    }
    
    @IBAction func selectImage(_ sender: Any) {
        let vc = BSImagePickerViewController()
        SelectedAssets = []
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
//        Auth.auth().currentUser?.displayName
        db.collection("")
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
