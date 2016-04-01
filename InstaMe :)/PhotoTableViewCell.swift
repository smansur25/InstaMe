//
//  PhotoTableViewCell.swift
//  InstaMe :)
//
//  Created by Sumaiya Mansur on 3/29/16.
//  Copyright © 2016 Sumaiya Mansur. All rights reserved.
//

import UIKit
import ParseUI
import Parse


class PhotoTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var profileImageView: PFImageView!
    
    var instagramPost: PFObject! {
        
        didSet {
            self.profileImageView.file = instagramPost["media"] as? PFFile
          // self.photoImageView.loadInBackground()
            captionLabel.text = instagramPost["caption"] as? String
            //nameLabel.text = instgramPost.user?.name
            nameLabel.text = PFUser.currentUser()?.username
        }
    }


    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
