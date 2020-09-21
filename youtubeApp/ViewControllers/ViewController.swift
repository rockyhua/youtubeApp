//
//  ViewController.swift
//  youtubeApp
//
//  Created by Macintosh on 2/9/20.
//  Copyright © 2020 Macintosh. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var logOut: UIButton!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Check whether user login
        self.authenticateUserAndConfigureView()
        
        // Set itself as the datasource and delegate
        TableView.dataSource = self
        TableView.delegate = self
        
        //set itself as the delegate of the model
        model.delegate = self
        
        model.getVideos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Confirm that a video was selected
        guard TableView.indexPathForSelectedRow != nil else{
            return
        }
        
        //Get a reference to the video that was tapped on
        let selectedVideo = videos[TableView.indexPathForSelectedRow!.row]
        
        //Get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        //Set the video property of the detail view controller
        detailVC.video = selectedVideo
    }
    
    //MARK: -auto login fucntion
    func authenticateUserAndConfigureView() {
        if(Auth.auth().currentUser == nil) {
            DispatchQueue.main.async {
                print("in")
                let loginVC = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.loginVC)
                
                self.view.window?.rootViewController = loginVC!
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    //MARK: - Log Out
    @IBAction func handleLogOut(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            let nav = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeNAV)
            
            view.window?.rootViewController = nav!
            view.window?.makeKeyAndVisible()
        }catch let error{
            print("Fail to sign out with error..", error)
        }
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

