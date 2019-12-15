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

class UploadImageViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectImage(_ sender: Any) {
        pickImageFromLibrary()
    }
    
    func pickImageFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerController.SourceType.photoLibrary

            present(controller, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let storage = Storage.storage()
        let storageRef = storage.reference(forURL: "gs://valued-visitor-244309.appspot.com")

        if let data = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage).pngData() {
            let reference = storageRef.child("image/1.jpg")
            reference.putData(data, metadata: nil, completion: { metaData, error in
                print(metaData)
                print(error)
            })
            dismiss(animated: true, completion: nil)
        }
    }
    
}
