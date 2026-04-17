//
        //
    //  Project: VisionOS_Planets2
    //  File: VisionOS_Planets2App.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

@main
struct VisionOS_Planets2App: App {
    var body: some Scene {
        // Primary window — the main solar system view.
        WindowGroup {
            ContentView()
        }
        .windowResizability(.contentSize)
        
        // Data-driven window group: a separate detail window can be opened for each Planet.
        // Planet must be Codable so the system can pass it across window boundaries.
        // openWindow(value: planet) in ContentView routes here automatically.
        WindowGroup(for: Planet.self) { $planet in
            PlanetDetailView(planet: planet)
        } defaultValue: {
            // Fallback value the system uses before any planet has been selected.
            Planet.all[0]
        }
        .windowResizability(.contentSize)
        // .plain removes the default glass chrome so PlanetDetailView can apply its own.
        .windowStyle(.plain)
        
        // Tip: add .defaultWindowPlacement here to control where planet windows appear.
        // See the commented-out example below for placing them beside the main window.
    }
}

//    .defaultWindowPlacement { _, context in
//        if let main = context.windows.first(where: { $0.id == "main" }) {
//            return WindowPlacement(.trailing(main))
//        }
//        return WindowPlacement()
//    }
//}
//}
