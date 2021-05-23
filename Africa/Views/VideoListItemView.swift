//
//  VideoListItem.swift
//  Africa
//
//  Created by Harshvardhan Basava on 22/05/21.
//

import SwiftUI

struct VideoListItemView: View {
    let video: VideoModel
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)//used a computed property
                    .resizable()
                    .scaledToFit()
                    .frame(height: 90)
                    .cornerRadius(9)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text(video.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            })
        }
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static let videos: [VideoModel] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
