//
//  Response.swift
//  youtubeApp
//
//  Created by Macintosh on 3/9/20.
//  Copyright © 2020 Macintosh. All rights reserved.
//

import Foundation

struct Response: Decodable {
    var items:[Video]?
    
    enum CodingKeys:String, CodingKey {
        case items
    }
    
    init(from decoder:Decoder) throws {
        //Parse item
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
