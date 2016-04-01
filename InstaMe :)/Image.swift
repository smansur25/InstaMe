//
//  Image.swift
//  InstaMe :)
//
//  Created by Sumaiya Mansur on 3/29/16.
//  Copyright © 2016 Sumaiya Mansur. All rights reserved.
//

import UIKit
import ParseUI
import Parse


class Image: NSObject {
    var user = String?()
    var caption = String?()
    var likesCount: Int = 0
    var commentsCount: Int = 0
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        let post = PFObject(className: "Image")
        
        post["media"] = getPFFileFromImage(image)
        post["author"] = PFUser.currentUser()
        post["caption"] = caption
        post["likesCount"] = 0
        post["commentsCount"] = 0
        post.saveInBackgroundWithBlock(completion)
    }
       class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
}



