//
//  EventManager.swift
//  faxxSwiftUI
//
//  Created by LVZ on 7/7/20.
//  Copyright © 2020 LVZ. All rights reserved.
//

import SwiftUI

class EventManager: ObservableObject {
    @Published var date = ""
    @Published var events = [Event]()
    @Published var dataHasLoaded = false
    
    init() {
        getEvents()
    }
}

extension EventManager {
    func getEvents(){
        
        if let url = URL(string: "https://history.muffinlabs.com/date") {
        
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                
                if error != nil {
                    
                    print(error!)
                    return
                
                }
                
                if let safeData = data {
                    
                    do {
                        
                        let response = try JSONDecoder().decode(EventData.self, from: safeData)
                        
                        DispatchQueue.main.async {
                            self.date = response.date
                            self.events = response.data.Events
                            self.dataHasLoaded = true
                        }
                    
                    }
                    catch {
                        print("Eror!", error)
                    }
                }
                
            }.resume()
        }
    }
}
