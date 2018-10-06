//
//  PhotoShareViewController.swift
//  InstaClone
//
//  Created by Jacob Frick on 10/5/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class PhotoShareViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var captionField: UITextField!
    @IBOutlet weak var shareableImageView: UIImageView!
    var image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onImageTap(_ sender: UITapGestureRecognizer) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageN = info[UIImagePickerControllerOriginalImage]{
            self.image.image =  imageN as? UIImage
        }        
        dismiss(animated: true, completion: {() -> Void in })
        let imageTemp = self.image.image!
        shareableImageView.image = imageTemp
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sharePhoto(_ sender: Any) {
        let caption = captionField.text!
        if shareableImageView.image != #imageLiteral(resourceName: "image_placeholder") && (!caption.isEmpty){
            Post.postUserImage(image: self.shareableImageView.image, withCaption: caption, withCompletion: nil)
            captionField.text = "";
            shareableImageView.image = #imageLiteral(resourceName: "image_placeholder")
            self.performSegue(withIdentifier: "shareToFeed", sender: nil)
        }
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: newSize.width, height: newSize.height)))
        resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
