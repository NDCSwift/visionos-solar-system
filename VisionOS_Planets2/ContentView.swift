//
        //
    //  Project: VisionOS_Planets2
    //  File: ContentView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI


struct ContentView: View {
    // Depth controls how far back each successive ring is pushed in 3D space.
    @State private var depth = 15.0
    // Two alternating ring colors — passed down to OrbitalRingsView.
    @State private var ringColors: [Color] = [.cyan, .purple]
    // Used to open a planet detail window when a planet button is tapped.
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack {
           Text("Solar System")
                .font(.largeTitle)
                .padding(.top, 30)
            // The ring system — re-renders reactively whenever depth or colors change.
            OrbitalRingsView(depth: depth, ringColors: ringColors)
        }
        .frame(minWidth: 520, minHeight: 420)
        // Ornaments float outside the window chrome — here it sits above the main window.
        .ornament(attachmentAnchor: .scene(.top)) {
            VStack(spacing: 16) {
                Grid(alignment: .leading) {
                    GridRow {
                        Text("Depth")
                        // Dragging this slider changes the Z-offset between rings.
                        Slider(value: $depth, in: 0...50) {
                            Text("Depth")
                        }
                        .frame(width: 160)
                    }
                    GridRow {
                        Text("Colors")
                        HStack {
                            // Ring A and Ring B alternate on adjacent rings.
                            ColorPicker("Ring A", selection: $ringColors[0])
                            ColorPicker("Ring B", selection: $ringColors[1])
                            Spacer()
                        }
                        .labelsHidden()
                    }
                }
                Divider()
                // One button per planet — tapping opens a detail window next to the main window.
                HStack(spacing: 16) {
                    ForEach(Planet.all) { planet in
                        Button {
                            // Passes the planet value to the WindowGroup(for: Planet.self) scene.
                            openWindow(value: planet)
                        } label: {
                            VStack {
                                Circle()
                                    .fill(planet.color)
                                    .frame(width: 26, height: 26)
                                Text(planet.name)
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(20)
            .glassBackgroundEffect()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
