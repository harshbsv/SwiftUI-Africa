//
//  VideoListView.swift
//  Africa
//
//  Created by Harshvardhan Basava on 20/05/21.
//

import SwiftUI

struct VideoListView: View {
    @State var videos: [VideoModel] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(
                        destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name),
                        label: {
                            VideoListItemView(video: item)
                                .padding(.vertical, 8)
                        })
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        //shuffle videos
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            })
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
