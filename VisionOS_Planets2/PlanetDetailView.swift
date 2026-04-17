//
        //
    //  Project: VisionOS_Planets2
    //  File: PlanetDetailView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    
import SwiftUI

// Shown in its own floating window when a planet button is tapped in ContentView.
// The window is opened via openWindow(value: planet) and handled by the
// WindowGroup(for: Planet.self) scene in the App file.
struct PlanetDetailView: View {
    let planet: Planet
    // dismissWindow closes THIS window without affecting any other open windows.
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        VStack {
            // Large planet colour swatch with a glow matching the planet's colour.
            Circle()
                .fill(planet.color)
                .frame(width: 80, height: 80)
                .shadow(color: planet.color.opacity(0.5), radius: 20)
            
            Text(planet.name)
                .font(.title.bold())
                .foregroundStyle(.white)
            
            Text(planet.fact)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.75))
                .multilineTextAlignment(.center)
            
            // orbitIndex is 0-based internally, so +1 gives the human-readable orbit number.
            Text("Orbit \(planet.orbitIndex + 1) from the Sun")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.5))
            
            Button("Close") {
                dismissWindow()
            }
            .padding(.top, 8)
        }
        .padding(35)
        // glassBackgroundEffect() applies the visionOS frosted-glass material.
        // The window uses .windowStyle(.plain) so this view owns the entire chrome.
        .glassBackgroundEffect()
    }
}

#Preview {
    PlanetDetailView(planet: Planet.all[2])
}
