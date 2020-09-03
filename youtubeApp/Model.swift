//
//  Model.swift
//  youtubeApp
//
//  Created by Macintosh on 3/9/20.
//  Copyright © 2020 Macintosh. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        //Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        //Get a URL session object
        let session = URLSession.shared
        
        //Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // check if there were errors
            if error != nil || data == nil {
                //print(error)
                return
            }
            
            // parsing data into video objects
            
        }
        
        //Kick off the task
        dataTask.resume()
    }
}
