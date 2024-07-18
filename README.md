# User Comments Application

This Flutter application is built to showcase fetching comments from an API, integrating Firebase Authentication and Remote Config, store user data in Firebase Firestore and implementing specific design requirements.

## Table of Contents

- [Features](#features)
- [Design Specs](#design-specs)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Firebase Setup](#firebase-setup)
  - [Authentication](#authentication)
  - [Firestore](#firestore)
  - [Remote Config](#remote-config)
- [Usage](#usage)
- [Error Handling](#error-handling)
- [State Management](#state-management)
- [Architecture](#architecture)
- [Dependencies](#dependencies)
- [Bonus Points Achievements](#bonus-points-achievements)
- [Screenshots](#screenshots)

## Features

- Firebase Authentication using email/password.
- Collect user details (name, email) and store them in Firestore.
- Fetch comments from `https://jsonplaceholder.typicode.com/comments`.
- Display comments with options to mask or show full email based on Firebase Remote Config.
- Error handling for backend services (API, Firebase).
- Form validation for user input.
- State management using Provider.
- Showing toast message whenever it's required
- Cross platform application able to run in Android, IOS, MacOS, Web and Windows

## Design Specs

The app follows the design specifications provided in Figma:

- [Design Prototype](https://www.figma.com/proto/bxw2feP7FQDnSlaslICoun/comments?node-id=24%3A236&scaling=scale-down&page-id=0%3A1&starting-point-node-id=7%3A3)

## Getting Started

### Prerequisites

- Flutter SDK (version >= 2.2.0)
- Firebase project setup (Authentication, Firestore, Remote Config)

### Installation

1. Clone the repository:

   ```bash
   git clone <reopository-name>
   ```

2. Change the directory:

   ```bash
   cd user_comments_assignment
   ```

3. Install the requirements:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

## Firebase Setup

### Authentication

- Enable Email/Password sign-in method in Firebase Console.

### Firestore

- Create a Firestore collection named users.

### Remote Config

- Create a boolean parameter mask_email in Firebase Remote Config.

## Usage

- Run the app on a connected device or emulator:

```bash
flutter run
```

- Sign up with your email to create an account.

- View comments fetched from the API with masked or full email based on Remote Config.

## Error Handling

- The app handles exceptions and errors gracefully, providing feedback to the user when services are unavailable or encounters errors.

## State Management

- State management is handled using the Provider package for efficient data flow and UI updates.

## Architecture

- The app follows the Provider architecture pattern for managing state and separating UI components from business logic.

## Dependencies

- Third-party dependencies used:
  1. provider for state management.
  2. http for making API requests.
  3. Other dependencies as needed for UI components and Firebase integration.

## Bonus Points Achievements

- Kept the app size as small as possible. (15.1MB Android Build)
- Followed latest design guidelines and implemented the provided design specs.
- Implemented error handling, form validation, and clean, usable UI.
- Utilized Provider for state management and ensured code quality and structure.

## Screenshots
<img src="https://github.com/user-attachments/assets/816f05bc-2cfb-4339-b050-b40c65e799e3" width="480">
<img src="https://github.com/user-attachments/assets/d932969c-c11d-4c98-9a37-86b12edfead8" width="480">
<img src="https://github.com/user-attachments/assets/ba06b248-63c5-4ac8-bca9-1f7ab3c02c53" width="480">
<img src="https://github.com/user-attachments/assets/6101940c-0cc4-4072-b60c-a181599f1388" width="480">
<img src="https://github.com/user-attachments/assets/eed09da7-36bb-4ce8-a86b-9ff46407e394" width="480">
<img src="https://github.com/user-attachments/assets/dfd313ac-c2fc-410c-b0ea-84401c5a6ccd" width="480">






