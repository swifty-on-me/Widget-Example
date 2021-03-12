//
//  FakeData.swift
//  Widget Example
//
//  Created on 07/12/2020.
//

import Foundation

// note:
// all ingredients of the salted bread are rendered on the widget.
// none of the ingredients for premium bread are rendered. Why is this happening?

let fakeData: [WsWidgetDetail] = [
    WsWidgetDetail(id: "1", recipe: "Salted bread", ingredients: ["Butter", "Salt"]),
    WsWidgetDetail(id: "2", recipe: "Premium bread", ingredients: ["Butter", "Salt", "Cheese", "Tomatoes", "Lettuce" ])
]
