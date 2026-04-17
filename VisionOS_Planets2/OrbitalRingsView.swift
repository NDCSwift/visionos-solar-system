//
        //
    //  Project: VisionOS_Planets2
    //  File: OrbitalRingsView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

struct OrbitalRingsView: View {
    // Controls how far back (in points) each ring is pushed along the Z-axis.
    // A depth of 0 makes all rings coplanar; higher values create a funnel effect.
    let depth: Double
    // Two colors that alternate between adjacent rings (even index / odd index).
    let ringColors: [Color]
    
    // The smallest ring diameter — used for the innermost planet (Mercury).
    private let minDiameter = 60.0
    // Each successive ring grows by this amount, keeping the orbits evenly spaced.
    private let diameterChange = 80.0
    
    var body: some View {
        ZStack {
            // The Sun at the centre of the system.
            Circle()
                .fill(RadialGradient(colors: [.yellow, .orange], center: .center, startRadius: 0, endRadius: 20))
                .frame(width: 40, height: 40)
            
            // One ring + planet dot per entry in Planet.all.
            // enumerated() gives us the index so we can calculate diameter and depth offset.
            ForEach(Array(Planet.all.enumerated()), id: \.element.id) { index, planet in
                
                let diameter = minDiameter + diameterChange * Double(index)
                // Each ring is pushed further back than the previous one.
                let backAmount = depth * Double(index)
                
                // Ring and its planet dot are grouped so they move together in 3D.
                ZStack {
                    // Orbital ring — stroke-only circle so the centre stays transparent.
                    Circle()
                        .stroke(lineWidth: 26)
                        .foregroundStyle(ringColors[index % 2])
                        .frame(height: diameter)
                    
                    // Planet dot at the 12 o'clock position on its ring.
                    // offset(y: -(diameter/2)) moves it from the ZStack centre to the ring edge.
                    Circle()
                        .fill(planet.color)
                        .frame(width: 20, height: 20)
                        .overlay(Circle().stroke(.white.opacity(0.4), lineWidth: 1.5))
                        .offset(y: -(diameter / 2))
                }
                // The extra 26pts (matching the stroke lineWidth) prevents the stroke from
                // being clipped by the ZStack's layout frame when padding3D is applied.
                .frame(width: diameter + 26, height: diameter + 26)
                // Push the entire ZStack (ring + planet) back along the Z-axis together.
                .padding3D(.back, backAmount)
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    OrbitalRingsView(depth: 15, ringColors: [.cyan, .purple])
}
