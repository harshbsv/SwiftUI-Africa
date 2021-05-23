//
//  VideosModel.swift
//  Africa
//
//  Created by Harshvardhan Basava on 21/05/21.
//

import SwiftUI

struct VideoModel: Codable, Identifiable{
    let id: String
    let name: String
    let headline: String
    //computed property
    var thumbnail: String{
        "video-\(id)"
    }
}
