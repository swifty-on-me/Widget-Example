//
//  SmallWidgetView.swift
//  CustomWidgetExtension
//
//  Created on 06/10/2020.
//

import SwiftUI
import WidgetKit
import UIKit

struct MediumWidgetUI: View {
    
    var entry: MediumWidgetIntentTimelineProvider.Entry
    
    var body: some View {
        if (entry.id == "none" || entry.id == "placeholder" || entry.id == "snapshot") {
            Text("pick a recipe")
        }
        else {
            GeometryReader { geo in
                ZStack(alignment: .topLeading) {
                    Color.init("#bf1b49")
                    VStack {
                        Text(entry.recipe)
                            .bold()
                        ForEach(entry.ingredients.indices) { index in
                            Text(entry.ingredients[index])
                        }
                    }
                }
            }
        }
    }
}
