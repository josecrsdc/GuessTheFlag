//
//  FlagStylesModifier.swift
//  GuessTheFlag
//
//  Created by Jose carlos Rodriguez on 16/11/22.
//

import SwiftUI

struct FlagStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
