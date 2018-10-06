//
//  PostDetailsViewController.swift
//  InstaClone
//
//  Created by Jacob Frick on 10/6/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class PostDetailsViewController: UIViewController {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionLabel.text = post.caption
        let date = NSDate(timeIntervalSince1970: post.timeInterval)
        timestampLabel.text = date.description
        do {
            let image = try UIImage(data: post.media.getData())
            postImage.image = image
        } catch {
            print("Error")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
