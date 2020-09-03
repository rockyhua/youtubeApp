//
//  ViewController.swift
//  youtubeApp
//
//  Created by Macintosh on 2/9/20.
//  Copyright © 2020 Macintosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}

