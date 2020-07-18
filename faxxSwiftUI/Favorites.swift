//
//  Favorites.swift
//  faxxSwiftUI
//
//  Created by LVZ on 7/18/20.
//  Copyright © 2020 LVZ. All rights reserved.
//

import SwiftUI

class Favorites: ObservableObject {
    private var events: [Events]
    
    init() {
        // load our saved data

        // still here? Use an empty array
        self.events = []
    }
    
    /*func contains(_ event:  Event) -> Bool {
        resorts.contains(resort.id)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ event: Event) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ event: Event) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        // write out our data
    }*/
}
