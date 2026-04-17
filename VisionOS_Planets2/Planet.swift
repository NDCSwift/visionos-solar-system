//
        //
    //  Project: VisionOS_Planets2
    //  File: Planet.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    import Foundation
import SwiftUI

// Planet is Codable so it can be passed as a WindowGroup value (visionOS requires this
// for data-driven window opening via openWindow(value:)).
// Hashable is needed for use in ForEach and as a navigation value.
struct Planet: Hashable, Codable, Identifiable {
    var id = UUID()
    var name: String
    var fact: String
    // Stored as an index rather than a Color directly because Color isn't Codable.
    var colorIndex: Int
    // Determines which orbital ring this planet sits on (0 = innermost).
    var orbitIndex: Int
    
    // Palette used across all planets — colorIndex wraps around if more planets are added.
    static let colors: [Color] = [.cyan, .yellow, .blue, .orange, .red]
    
    var color: Color {
        Planet.colors[colorIndex % Planet.colors.count]
    }
    
    // Single source of truth for planet data. Add more planets here and
    // OrbitalRingsView will automatically render additional rings for them.
    static let all: [Planet] = [
        Planet(name: "Mercury", fact: "Closest to the Sun", colorIndex: 0, orbitIndex: 0),
        Planet(name: "Venus", fact: "Hottest Planet", colorIndex: 1, orbitIndex: 1),
        Planet(name: "Earth", fact: "Our Home Planet", colorIndex: 2, orbitIndex: 2),
        Planet(name: "Mars", fact: "The Red Planet", colorIndex: 3, orbitIndex: 3),
        Planet(name: "Jupiter", fact: "Largest Planet", colorIndex: 4, orbitIndex: 4),
    ]
    
}
