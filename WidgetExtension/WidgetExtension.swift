//
//  CustomWidget.swift
//  CustomWidget
//
//  Created on 02/10/2020.
//

import WidgetKit
import SwiftUI

@main
struct CustomWidgets: WidgetBundle {
  var body: some Widget {
    // this does normally also contain references to small and large widgets
    MediumWidgetContext()
  }
}
