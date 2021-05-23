//
//  MapView.swift
//  Africa
//
//  Created by Harshvardhan Basava on 20/05/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    let locations: [NationalParkLocationModel] = Bundle.main.decode("locations.json")
    var body: some View {
        // A Basic Map
        //Map(coordinateRegion: $region)
        // Advanced map with annotations
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            //Pin old style, always static
            //MapPin(coordinate: item.location, tint: .accentColor)
            //New style, always static
            //MapMarker(coordinate: item.location, tint: .accentColor)
            //custom basic annotation, could be interactive
//            MapAnnotation(coordinate: item.location, content: {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            })
            //custom dynamic annotation
            MapAnnotation(coordinate: item.location, content: {
                MapAnnotationView(location: item)
            })
        })
        .overlay(
            HStack(alignment: .center, spacing: 12, content: {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3, content: {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                })
            })
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding(), alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
