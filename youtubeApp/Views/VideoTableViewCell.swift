//
//  VideoTableViewCell.swift
//  youtubeApp
//
//  Created by Macintosh on 5/9/20.
//  Copyright © 2020 Macintosh. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailmageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        self.video = v
        
        //Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        //set the title and date
        self.titleLabel.text = video?.title
        
        //cast date to string
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)

        // set the thumbnail
        guard self.video!.thumbnail != "" else{
            return
        }
        
        //Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            //Set the thumbnail image view
            self.thumbnailmageView.image = UIImage(data: cachedData)
            return
        }
        
        // download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL session object
        let session = URLSession.shared
        
        //create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                //save the data in cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                //check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail {
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                //create the image object
                let image = UIImage(data: data!)
                
                //set the image view
                DispatchQueue.main.async {
                    self.thumbnailmageView.image = image
                }
            }
        }
        // Start data task
        dataTask.resume()
    }

}
