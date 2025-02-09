# SpotLabs iOS Assignment

This project is a simple cryptocurrency token listing app built with **SwiftUI**. It displays token names, prices, and logos fetched from an API, using a custom image caching mechanism to improve performance.

---

## 🚀 Features
- Fetches token data via an API and displays it in a scrollable list.
- Caches images using a custom `CachedAsyncImage` to minimize network requests.
- Handles loading states and shows a placeholder when images are unavailable.
- Error handling with a retry mechanism in case the API request fails.

---

## ⚠️ Note About SVG Images
One of the token logos provided by the API was in **SVG format**. Because this was an hour-long assignment, I chose not to handle SVGs programmatically. Currently, the app shows a placeholder for SVG images.
In the future, I would handle this by using:
- **A library like `SVGKit`**, or
- **Server-side conversion of SVGs to PNGs** before fetching.
