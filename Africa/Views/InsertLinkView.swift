//
//  InsertLinkView.swift
//  Africa
//
//  Created by Harshvardhan Basava on 22/05/21.
//

import SwiftUI

struct InsertLinkView: View {
    let animal: AnimalModel
    var body: some View {
        GroupBox{
            HStack{
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group{
                    Link(destination: URL(string: animal.link) ?? URL(string: "https://www.wikipedia.com")!, label: {
                        Text(animal.name)
                    })
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}

struct InsertLinkView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsertLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
