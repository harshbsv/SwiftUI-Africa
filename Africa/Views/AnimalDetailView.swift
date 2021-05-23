//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Harshvardhan Basava on 22/05/21.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: AnimalModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 20, content: {
                //Hero/Cover Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                //Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                //Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                //Gallery
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsertGalleryView(animal: animal)
                }
                .padding(.horizontal)
                //Facts
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsertFactView(animal: animal)
                }
                .padding(.horizontal)
                //Description
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    InsertDescriptionView(animal: animal)
                }
                .padding(.horizontal)
                //Map
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsertMapView()
                }
                .padding(.horizontal)
                //Link
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    InsertLinkView(animal: animal)
                }
                .padding(.horizontal)
            })
            .navigationBarTitle("Learn more about \(animal.name)", displayMode: .inline)
        })
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[0])
        }
    }
}
