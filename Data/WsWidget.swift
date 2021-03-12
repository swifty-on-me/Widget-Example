//
//  SmallWidgetClass.swift
//  app
//
//  Created on 05/10/2020.
//

import Foundation
import UIKit

public class WsWidgetObj {
    @NSManaged public var recipe: String?
    @NSManaged public var id: String?
}

struct WsWidgetDetail {
    var id: String
    var recipe: String
    var ingredients: [String]
}
