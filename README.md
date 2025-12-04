# Union Shop (Flutter)

A small Flutter web/mobile storefront demo for a university shop. The app provides simple product collections, product pages, a cart, and informational pages — built with straightforward, responsive Flutter widgets.

## Features

- Home screen with hero banner and featured products
- Collections pages (Essential range, Sale items)
- Product detail page
- Simple cart (in-memory add-to-cart)
- Print Shack informational pages
- Responsive layout for mobile/tablet/desktop

## Prerequisites

- Flutter SDK (stable channel)
- A working IDE (VS Code, Android Studio) or command line

## Getting started

1. Clone the repository or copy the project files into a folder:

   git clone <your-repo-url>

2. Ensure assets are declared in `pubspec.yaml`. Add (or confirm) an assets block like:

   flutter:
     assets:
       - assets/images/

3. Install dependencies and get packages:

   flutter pub get

4. Run the app (choose a device/emulator or run as web):

   flutter run


## Project routes

The app registers several named routes in `lib/main.dart`. These are useful when navigating programmatically:

- `/` — HomeScreen
- `/product` — ProductPage
- `/about` — AboutUsPage
- `/collections` — CollectionsPage
- `/collections/essential-range` — EssentialCollectionPage
- `/collections/sale-items` — SaleCollectionPage
- `/auth` — AuthPage
- `/print-shack/text` — PrintShackTextPage
- `/print-shack/about` — PrintShackAboutPage
- `/cart` — CartPage

## Assets

Place images under `assets/images/`. The app expects image files referenced in code, for example:

- assets/images/university_hoodie.png
- assets/images/university_t-shirt.png
- assets/images/university_t-shirt2.jpg
- assets/images/university_joggers.png
- assets/images/hoodies_sweatshirts.jpg
- assets/images/university_lanyard.png
- assets/images/university_shirt-man.png

If an image fails to load, the UI falls back to a neutral placeholder.

## Notes about cart and state

The current cart implementation is in-memory and ephemeral. It is suitable for demo purposes but not persistent across app restarts. Consider integrating a state-management solution (Provider, Riverpod, Bloc) and persistent storage (SQLite, shared_preferences) for production.

## Project structure (high level)

- lib/
  - main.dart
  - essential_collection.dart
  - sale_collection.dart
  - collections_page.dart
  - product_page.dart
  - cart_page.dart
  - auth_page.dart
  - about_us.dart
  - print_shack_text.dart
  - print_shack_about.dart
  - top_navbar.dart

## Contributing

Contributions are welcome. Open an issue describing the change, then create a PR. Keep changes focused, and ensure assets and routes remain consistent.

## License

Add a LICENSE file for your preferred license. This project does not include one by default.

---

If you want, I can also add a minimal LICENSE, update pubspec.yaml to include assets automatically, or generate a CONTRIBUTING.md.