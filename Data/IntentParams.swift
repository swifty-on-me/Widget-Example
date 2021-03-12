//
//  Utils.swift
//  app
//
//  Created on 05/10/2020.
//

import Foundation

extension WsWidgetParam {
  convenience init(myWidget: WsWidgetDetail) {
    self.init(identifier: myWidget.id, display: myWidget.recipe)
  }
}
