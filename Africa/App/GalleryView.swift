//
//  GalleryView.swift
//  Africa
//
//  Created by Harshvardhan Basava on 20/05/21.
//

import SwiftUI

struct GalleryView: View {
    @State private var selectedAnimal: String = "lion"
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    //dynamic grid layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    //simple grid definition
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    //advanced grid definition
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                })
                .animation(.easeIn)
                .onAppear(perform: {
                        gridSwitch()
                    }
                )
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //this line will add an animation
        //.background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
