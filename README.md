# FourSquareV2

Simple iOS app built with **SwiftUI**, **MVVM**, and a lightweight **Coordinator** setup.
The app fetches nearby venues using the Foursquare API based on the user’s current location.

---

## Features

* Gets the user’s current latitude & longitude
* Calls Foursquare Venues Search API
* Shows a list of nearby venues (name, address, category, icon)
* Basic Tab Bar: **Home**, **Profile**, **More**
* Terms & Conditions screen under "More"
* Simple navigation handled using Coordinators
* Minimal, clean structure built from scratch

---

## Project Structure

```
Coordinators/
Modules/
Networking/
Managers/
Models/
```

* **Modules** → Views + ViewModels
* **Managers** → Location + Network monitor
* **Networking** → API client + request builder
* **Coordinators** → Navigation for Home, More, and Tab Bar

---

## Requirements

* iOS 16+
* Xcode 15+

