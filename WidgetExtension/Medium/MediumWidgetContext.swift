//
//  SmallWidgetContext.swift
//  CustomWidgetExtension
//
//  Created on 06/10/2020.
//

import SwiftUI
import WidgetKit

struct MediumWidgetEntry: TimelineEntry {
    let date: Date
    var id: String
    var recipe: String
    var ingredients: [String]
}

struct MediumWidgetContext: Widget {
    private let kind: String = "Ws-medium"
    
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: SelectMediumWidgetIntent.self, provider: MediumWidgetIntentTimelineProvider(), content: { (entry) in
            MediumWidgetUI(entry: entry)
        })
        .configurationDisplayName("Medium Widget")
        .description("Medium Widget")
        .supportedFamilies([.systemMedium])
    }
}
