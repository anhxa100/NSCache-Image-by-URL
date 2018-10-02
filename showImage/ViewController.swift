//
//  ViewController.swift
//  showImage
//
//  Created by anhxa100 on 9/29/18.
//  Copyright © 2018 anhxa100. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    var activityIndicator = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spiner.hidesWhenStopped = true
        self.spiner.startAnimating()
        view.addSubview(self.activityIndicator)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let imageUrlString = "https://www.runrocknroll.com/-/media/rnr/images/events/las-vegas/images/rnr-lv-18-page-content/rnr-lv-2018-5k.jpg?la=zh&hash=03068B7784C83CCA2EF2C58DFC339C5AE2B0BAE4"
        let imageUrl:URL = URL(string: imageUrlString)!
        
        CacheImage.getImage(withURL: imageUrl) { image in
            self.imageView.image = image
        }
    }
}
