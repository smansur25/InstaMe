//
//  PhotoViewController.swift
//  InstaMe :)
//
//  Created by Sumaiya Mansur on 3/29/16.
//  Copyright © 2016 Sumaiya Mansur. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UITextViewDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    @IBOutlet weak var captureButton: UIButton!
    
 //   var instagramPost = [PhotoTableViewCell]! ()
    
    let vc = UIImagePickerController()
  
    //let post = [PFObject]! ()
    //var instagramPost: [PFObject]!()


    override func viewDidLoad() {
        super.viewDidLoad()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        // captionTextView.text = instragramPost.text
        captionTextView.text = "What's on your mind"
        captionTextView.textColor = UIColor.init(hue: CGFloat(20), saturation: CGFloat(30), brightness: CGFloat(50), alpha: CGFloat(10))
        self.presentViewController(vc, animated: true, completion: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func imagePickerController(picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = originalImage
        photoImageView .contentMode = .ScaleAspectFit
      
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onLibrary(sender: AnyObject) {
        
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBAction func onCamera(sender: AnyObject) {
        
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    @IBAction func onUpdate(sender: AnyObject) {
    let updateImage = post.resize(photoImageView.image!, newSize: CGSize(width: 500, height: 300))
    post.postUserImage(updateImage, withCaption: captionTextView.text) { (success: Bool, error: NSError?) -> Void in
            
            if success {
                print("Hello from the other side")
                
                 self.captionTextView.text = nil
                self.photoImageView.image = nil
                
                self.tabBarController?.selectedIndex = 0
            } else {
                print("error: \(error?.localizedDescription)")
            }
            
        }
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
