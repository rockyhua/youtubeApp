//
//  ViewController.swift
//  youtubeApp
//
//  Created by Macintosh on 2/9/20.
//  Copyright © 2020 Macintosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    @IBOutlet weak var TableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set itself as the datasource and delegate
        TableView.dataSource = self
        TableView.delegate = self
        
        //set itself as the delegate of the model
        model.delegate = self
        
        model.getVideos()
    }
    //MARK: -Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
        
        //set the videos
        self.videos = videos
        
        //refreshh the tableview
        TableView.reloadData()
    }
    
    
    //MARK: - TableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //conigure cell
        //get the title for the video in question
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        //return cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }


}

