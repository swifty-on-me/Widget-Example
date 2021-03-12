//
//  IntentHandler.swift
//  WidgetIntent
//
//  Created on 05/10/2020.
//

import Intents
import UIKit

class IntentHandler: INExtension, SelectMediumWidgetIntentHandling {
  
  func provideMyWidgetOptionsCollection(for intent: SelectMediumWidgetIntent, with completion: @escaping (INObjectCollection<WsWidgetParam>?, Error?) -> Void) {
    
    let mediumWidgets: [WsWidgetDetail] = getWidgets(size: "medium")
    
    let characters: [WsWidgetParam] = mediumWidgets.map { _mw in
                let widget = WsWidgetParam(
                  identifier: _mw.id,
                    display: _mw.recipe
                )
                return widget
            }
    
    let collection = INObjectCollection(items: characters)
    completion(collection, nil)
  }
  
  override func handler(for intent: INIntent) -> Any {
    return self
  }
}
