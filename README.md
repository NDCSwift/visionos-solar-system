# 🪐 visionOS Solar System
A SwiftUI visionOS app that renders an interactive 3D solar system using orbital rings, multi-window planet detail views, and floating ornaments.

---

## 🤔 What this is
This project demonstrates how to build a spatially-aware solar system viewer for Apple Vision Pro. It uses `padding3D` to push orbital rings back along the Z-axis, `openWindow(value:)` to spawn a separate detail window per planet, and visionOS ornaments with glass materials to float controls outside the main window chrome.

## ✅ Why you'd use it
- **3D depth layout** — `padding3D(.back, n)` staggers each orbital ring in real Z-space, creating a true funnel effect without any RealityKit boilerplate
- **Data-driven multi-window** — `WindowGroup(for: Planet.self)` + `openWindow(value: planet)` shows how to open typed windows from Codable value types
- **Glass ornaments** — a floating control panel using `.ornament(attachmentAnchor:)` and `.glassBackgroundEffect()` demonstrates the visionOS chrome model

Part 1 of the series can be found here [PART 1 REPO](https://github.com/NDCSwift/SpatialDemo_SwiftUI).
Part 3 with a volumetric 3D globe (drag-to-rotate, pinch-to-zoom, RealityKit gestures) can be found here [PART 3 REPO](https://github.com/NDCSwift/GlobeView).

## 📺 Watch on YouTube
[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/1aYbYY14Cm0)

> This project is **Part 1** of the visionOS Solar System series.
> 📋 [View the full playlist](https://www.youtube.com/playlist?list=PLbeGXTt3IOd8o7W2dLSzhuFWk_qrIimiW)

> Built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97).

---

## 🚀 Getting Started

### 1. Clone
```bash
git clone https://github.com/NDCSwift/visionos-solar-system.git
```

### 2. Open
Open `VisionOS_Planets2.xcodeproj` in Xcode.

### 3. Set your Team
In **Signing & Capabilities**, select your Apple Developer team.

### 4. Update Bundle ID
Change `com.example.VisionOS-Planets2` to your own reverse-DNS identifier.

---

## 🛠️ Notes
- No external dependencies — pure SwiftUI + visionOS SDK
- The `Packages/RealityKitContent` package is included for project completeness but unused in the tutorial; the solar system is built entirely with SwiftUI
- `Planet` is `Codable` + `Hashable` so it can cross window boundaries via `openWindow(value:)` — a visionOS requirement

## 📦 Requirements
| | |
|---|---|
| Xcode | 26.0+ |
| visionOS SDK | 26.0+ |
| Device | Apple Vision Pro or visionOS Simulator |

---

📺 [Watch the guide on YouTube](https://youtube.com/watch?v=PLACEHOLDER)
