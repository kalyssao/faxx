//
//  EventData.swift
//  faxxSwiftUI
//
//  Created by LVZ on 7/8/20.
//  Copyright © 2020 LVZ. All rights reserved.
//
import SwiftUI

struct EventData: Codable {
    let date: String
    let url: String
    let data: Data
}

struct Data: Codable {
    let Events: [Event]
}

struct Event: Codable, Hashable {
    let year : String
    let text : String
}
