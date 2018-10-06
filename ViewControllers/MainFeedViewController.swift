//
//  MainFeedViewController.swift
//  InstaClone
//
//  Created by Jacob Frick on 10/5/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class MainFeedViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    var userPosts: [Post] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        tableView.dataSource = self
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.insertSubview(refreshControl, at: 0)
        // Do any additional setup after loading the view.
        getPosts()
    }
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
        getPosts()
    }
    func getPosts() {
        let query = Post.query()
        query?.limit = 20
        query?.addDescendingOrder("createdAt")
        // fetch data asynchronously
        query?.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts as? [Post] {
                // do something with the array of object returned by the call
                self.userPosts = posts
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            } else {
                print(error!.localizedDescription)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: Any) {
       PFUser.logOut()
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPosts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InstaPostCell", for: indexPath) as! InstaPostCell
        do {
            let image = try UIImage(data: userPosts[indexPath.row].media.getData())
            cell.postImageView.image = image
            cell.captionLabel.text = userPosts[indexPath.row].caption
            let date = NSDate(timeIntervalSince1970: userPosts[indexPath.row].timeInterval)
            cell.postDateLabel.text = date.description
        } catch {
            print("Error")
        }
        
        return cell
    }
    
    
}
