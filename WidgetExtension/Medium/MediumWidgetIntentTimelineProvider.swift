//
//  CustomWidget.swift
//  CustomWidget
//
//  Created on 02/10/2020.
//

import WidgetKit
import SwiftUI

class MediumWidgetIntentTimelineProvider: IntentTimelineProvider {
    
    typealias Entry = MediumWidgetEntry
    typealias Intent = SelectMediumWidgetIntent
    
    private var prevRefreshId: String = "none"
    private var prevWidgetId: String = "none"
    
    func placeholder(in context: Context) -> MediumWidgetEntry {
        MediumWidgetEntry(date: Date(), id: "placeholder", recipe: "none", ingredients: [])
    }
    
    func getSnapshot(for configuration: SelectMediumWidgetIntent, in context: Context, completion: @escaping (MediumWidgetEntry) -> Void) {
        let entry = MediumWidgetEntry(date: Date(), id: "snapshot", recipe: "none", ingredients: [])
        completion(entry)
    }
    
    func getTimeline(for configuration: SelectMediumWidgetIntent, in context: Context, completion: @escaping (Timeline<MediumWidgetEntry>) -> Void) {
        
        let widgetIdentifier: String = configuration.myWidget?.identifier ?? "none"
        let recipeName: String = configuration.myWidget?.displayString ?? "none"
        
        if (widgetIdentifier == "none") {
            // load sample widget
            print("[i] No widget selected")
            
            let sampleEntry = MediumWidgetEntry(date: Date(), id: "none", recipe: "none", ingredients: [])
            
            let timeline = Timeline(entries: [sampleEntry], policy: .never)
            completion(timeline)
        }
        
        else {
            // load custom widget
            
            let allWidgets: [WsWidgetDetail] = getWidgets(size: "medium")
            
            var selectedWidget = WsWidgetDetail(id: "none", recipe: "none", ingredients: [])
            for widget in allWidgets where widget.id == widgetIdentifier {
                selectedWidget = WsWidgetDetail(id: widget.id, recipe: widget.recipe, ingredients: widget.ingredients)
                break
            }
            
            print("[!] New widget configuration found")
            
            // create entries
            var entries = [MediumWidgetEntry]()
            let currentDate = Date()
            let midnight = Calendar.current.startOfDay(for: currentDate)
            let nextMidnight = Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
            
            for offset in 0 ..< 60 * 24 {
                
                let entryDate = Calendar.current.date(byAdding: .minute, value: offset, to: midnight)!
                
                entries.append(MediumWidgetEntry(date: entryDate, id: widgetIdentifier, recipe: recipeName, ingredients: selectedWidget.ingredients))
            }
            
            let timeline = Timeline(entries: entries, policy: .after(nextMidnight))
            completion(timeline)
        }
    }
}
