//
//  HomeViewController.swift
//  InstaMe :)
//
//  Created by Sumaiya Mansur on 3/29/16.
//  Copyright © 2016 Sumaiya Mansur. All rights reserved.
//

import UIKit
import Parse
//import ParseUI

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var pictures = [PFObject]!()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        func getData(){
            let query = PFQuery(className: "instagramPost")
            query.whereKey("likesCount", greaterThan: 100)
            query.limit = 20
            
            // fetch data asynchronously
            query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
                if let post = posts {
                } else {
                    print(error?.localizedDescription)
                }
            }
        }

        func viewWillAppear(animated: Bool) {
            getData()
            tableView.reloadData()
        }
        
        func refreshControlAction(refreshControl: UIRefreshControl) {
            
            self.tableView.reloadData()
            refreshControl.endRefreshing()
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if pictures != nil{
         return pictures!.count
         } else {
         return 0
    }
    }

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
     {
    let cell = tableView.dequeueReusableCellWithIdentifier("ImageCell", forIndexPath: indexPath) as! PhotoTableViewCell
        cell.instagramPost = pictures?[indexPath.row]
        return cell
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
