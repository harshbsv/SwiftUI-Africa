//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Harshvardhan Basava on 23/05/21.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: AnimalModel
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
