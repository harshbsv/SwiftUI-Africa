//
//  InsertDescriptionView.swift
//  Africa
//
//  Created by Harshvardhan Basava on 22/05/21.
//

import SwiftUI

struct InsertDescriptionView: View {
    let animal: AnimalModel
    var body: some View {
        Text(animal.description)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
    }
}

struct InsertDescriptionView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsertDescriptionView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
