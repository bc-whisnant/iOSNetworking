//
//  ViewController.swift
//  ImageRequest
//
//  Created by Jarrod Parkes on 11/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Add all the networking code here!
        let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg")!
        
        //manages network requests on our behalf
        //this is a singleton - can only be instantiated once
        //must supply request ---> known as a task to urlsession
        // DIFFERENT TYPES OF TASKS
        //data task - returns data from network into memory - short lived requests
        //download task - returns data from network into temporary file
        //upload task - uploading content
        
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            print("task finished")
            
            // error checking and assigning the image to the image view
            if error == nil {
                
                // this constructs image directly from data
                let downloadImage = UIImage(data: data!)
                
                //this sets the image as the background of the image view
                // always use performUIUpdatesOnMain when you are updating something through networking
                performUIUpdatesOnMain {
                    self.imageView.image = downloadImage
                }
                
            }
        }
        
        // must use resume method for the task to actually work
        task.resume()
    }
}

