# tezda_task

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Flutter E-commerce App with Riverpod, Mockito, and HTTPS

This Flutter project is a simple E-commerce app that allows users to browse a list of products fetched from a mock API, view product details, register an account, log in securely, mark products as favorites, and manage their profile.
Features

    Product Listing Screen:
        Displays a list of products fetched from -[API URL](https://dummyjson.com/products) using the HTTP protocol.
        Each product includes its name, price, and an image.
        Implements a navigation mechanism for users to tap on a product to view its details.
        The app is designed to be responsive and works seamlessly on both iOS and Android devices.

    Product Detail Screen:
        Shows additional information about the selected product, including description, specifications, and user reviews.

    Favorites Feature:
        Enhances the product listing screen by adding a "Favorites" feature.
        Users can mark products as favorites by tapping on a heart icon.

Technologies Used

    Flutter:
        Framework for building natively compiled applications for mobile, web, and desktop from a single codebase.

    Riverpod:
        State management library for Flutter that helps organize and manage the app's state in a scalable and testable way.

    Mockito:
        Mocking framework for Dart and Flutter. Used for testing by creating mock objects and verifying interactions.

    HTTPS:
        The app communicates with the https://dummyjson.com/products API over HTTPS for fetching product data.

Project Structure

The project is organized into different directories:

    lib: Contains the main Dart code for the Flutter app.
        screens: Includes the main screens of the app (ProductListing, ProductDetail).
        providers: Houses Riverpod providers for state management.
        data: contains the api calls and repository
        models: Defines data models for products, user profiles, etc.
        widgets: Contains reusable widgets such as ProductCard, FavoriteButton, etc.
    test: Holds unit and widget tests using Mockito for mocking

