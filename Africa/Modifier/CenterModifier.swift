//
//  CenterModifier.swift
//  Africa
//
//  Created by Harshvardhan Basava on 23/05/21.
//

import SwiftUI

struct CenterModifier: ViewModifier{
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
