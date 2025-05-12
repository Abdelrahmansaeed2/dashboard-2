# Dashboard App

A Flutter web application with Firebase integration, based on a Figma design.

## Features

- Responsive UI that adapts to different screen sizes
- Firebase integration for data storage
- Clean architecture implementation
- User authentication (ready to implement)
- Item management

## Project Structure

The project follows clean architecture principles:

- **Domain Layer**: Contains business logic, entities, and repository interfaces
- **Data Layer**: Implements repositories and data sources
- **Presentation Layer**: Contains UI components and state management

## Getting Started

### Prerequisites

- Flutter SDK
- Firebase account
- Firebase CLI

### Setup

1. Clone the repository
2. Update Firebase configuration in `lib/firebase_options.dart`
3. Run `flutter pub get` to install dependencies
4. Run `flutter run -d chrome` to start the app in development mode

### Deployment

1. Build the web app: `flutter build web`
2. Deploy to Firebase Hosting: `firebase deploy`

## Firebase Configuration

Before running the app, you need to:

1. Create a Firebase project in the Firebase Console
2. Enable Firestore database
3. Configure Firebase Authentication if needed
4. Update the Firebase configuration in `lib/firebase_options.dart`
5. Update the project ID in `.firebaserc`

## Responsive Design

The app is designed to be responsive across different screen sizes:
- Mobile: 1 column layout
- Tablet: 2 column layout
- Desktop: 3-4 column layout

## Clean Architecture

The app follows clean architecture principles:
- **Entities**: Domain models like Item and User
- **Repositories**: Abstract interfaces for data operations
- **Use Cases**: Business logic (implemented directly in providers for simplicity)
- **Presentation**: UI components and state management
