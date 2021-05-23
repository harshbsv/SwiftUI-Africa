//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Harshvardhan Basava on 23/05/21.
//

import SwiftUI

struct MapAnnotationView: View {
    var location: NationalParkLocationModel
    @State private var animation: Double = 0.0
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }
        .onAppear{
            withAnimation(Animation.easeOut(duration: 1.5).repeatForever(autoreverses: false)){
                animation = 1.0
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var location: [NationalParkLocationModel] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnnotationView(location: location[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
