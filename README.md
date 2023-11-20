# Weather App
Welcome to the Weather App! This application allows users to access weather details by entering a city name. It utilizes the OpenWeather API to fetch weather information for specified cities.

### Functionality
Upon launching the app, users are prompted to sign in via Google authentication using Firebase services. Once signed in, users have access to two main sections:

### Home Page
On the home page, users can input a city name to retrieve its weather details. The app fetches data from the OpenWeather API using the following endpoint:

### Profile Page
In the profile section, users can view their Google sign-in details along with a convenient logout button.

## Screenshots

<p float="left">
  <img src="https://github.com/SanskarModi22/WeatherApp/assets/80542560/f79aa3d1-4af4-44de-827d-b6cb7d6c9910" width="200" /> 
  <img src="https://github.com/SanskarModi22/WeatherApp/assets/80542560/c4c71cdb-61eb-47bf-ac76-647f910ba4fa" width="200" />
  <img src="https://github.com/SanskarModi22/WeatherApp/assets/80542560/3f248eb1-7d10-4e3a-bbab-4812c4009ada" width="200" />
</p>

## Install the APK

You can install the Weather App on your Android device by downloading the APK file from the following link:

[Download Weather App APK](https://drive.google.com/file/d/1JgFJCNe0PN93HzKpfxBL0LwZwd1Y00vW/view?usp=drive_link)


## Screen Recording

To get an overview of the Weather App's features and functionality, you can watch a screen recording by following this link:

[View Screen Recording](https://drive.google.com/file/d/1T_dRSXPJDlZViD6MTkht8GdyBuRQo2sf/view?usp=drive_link)

## Packages/Imports Used

The Weather App utilizes the following packages and imports for its functionality:

- **auto_route**: Simplifies navigation setup and generation of route helpers for Flutter apps.
- **cupertino_icons**: Default icon set for Cupertino (iOS-style) widgets.
- **firebase_auth**: Provides authentication services via Firebase.
- **firebase_core**: Essential Firebase functionalities for Flutter apps.
- **flutter_dotenv**: Allows loading environment variables from a .env file.
- **flutter_riverpod**: State management library for Flutter applications.
- **google_sign_in**: Handles Google sign-in authentication.
- **http**: Allows making HTTP requests to external APIs.
- **intl**: Provides internationalization and localization utilities.
- **logger**: A logging package for better debugging and logging capabilities.
- **shimmer**: Enables shimmer effect/loading placeholders in UI components.

## Architecture Followed

Weather App follows the MVVM (Model-View-ViewModel) architecture, separating concerns into different aspects:

- **Models:** Represents the data model, including the structure for weather data and core data entities.

- **Pages:** Represents the user interface (UI) elements, including the login page, home page, and visual components.

- **Providers:** Acts as a bridge between the Model and View, providing central data management and communication.

Riverpod is used for state management, ensuring a clean and maintainable codebase that promotes scalability and code quality.

### Clean Architecture Elements

#### Separation of Concerns
The project structure suggests a clear separation between different layers such as UI components, data handling, and external services. Each layer seems to have a distinct responsibility, minimizing dependencies between them.

#### Dependency Inversion Principle
There might be abstractions/interfaces used in repositories or service layers. This practice allows high-level modules to depend on abstractions rather than specific implementations, enabling flexibility and easier testing.

### Repository Pattern

#### Data Handling
The `repositories` directory seems dedicated to handling data retrieval and storage. There are likely classes responsible for abstracting data sources, such as Firebase authentication and weather data from OpenWeather API.

### Presentation Layer Patterns

#### Widget-Based UI
The UI appears to be structured around Flutter's widget-based architecture. Screens and components are segregated into folders within `components` and `pages`.


## API Usage

The app relies on the OpenWeather API to retrieve weather data for specified cities. Users enter a city name, and the app fetches weather information for that location. Key aspects related to API usage:
```dart
https://api.openweathermap.org/data/2.5/weather?id={city id}&appid={API key}
```
- The project separates API-related logic from the UI, promoting a modular and clean code structure. The `repositories` folder contains functions for making API requests, while API keys are securely stored in environment variables.

## Authentication

Authentication within Weather App is handled through Google Sign-In, using Firebase. The project includes the following components to manage authentication states:

- **Authentication Provider:**(auth_provider) Responsible for authentication methods and user information.

- **Authentication State Provider:**(stream auth changes) Manages states such as loading, errors, the login page, and the home page. This provider tracks the user's authentication status.

- **AuthChecker:**(auth_checker) Manages these authentication-related components, ensuring a smooth user experience by handling login and navigation between the login page and home page based on the user's authentication status.

## Folder Structure

<p float="left">
<img width="200" alt="weather-page-structure" src="https://github.com/SanskarModi22/WeatherApp/assets/80542560/33d9a523-76f7-4c1c-a746-d3743da74d20">
</p>

<!-- ![Folder structure](https://i.ibb.co/p0JBzCN/Screenshot-2023-11-07-at-3-42-03-AM.png) -->

The Weather App project has a well-structured folder organization for a clear separation of different components. The structure may look as follows:

The app follows a modular and structured approach to organize code:

- **components**: Contains UI elements like widgets and screens.
  - **widgets**: Reusable UI components.
  - **screens**: Different app screens like home, login, and profile.

- **constants**: Stores constant values used throughout the app.
  - **api_const**: Holds API-related constants.
  - **color_const**: Stores color constants.
  - **custom_style**: Contains custom styling definitions.

- **models**: Houses data models used within the app.
  - **search_city_model**: Data model related to city search.

- **pages**: Organizes different pages/screens of the app.
  - **home_page**: Home screen components.
    - **widgets**: Specific widgets related to the home page.
    - **home_screen**: Home screen implementation.
  - **login**: Components related to user authentication.
    - **auth_check**: Authentication check logic.
    - **login_page**: Login page components.
  - **profile_page**: Components related to user profiles.
    - **profile_page**: Profile page components.

- **providers**: Handles state management using Riverpod.
  - **searchcity**: Manages state related to city search functionality.
    - **search_city_notifier**: Notifier for city search.
    - **search_city_provider**: Provider for city search functionality.
    - **search_city_state**: State related to city search.
  - **auth_provider**: Manages the google authentication

- **repositories**: Deals with data handling and services.
  - **auth_repo**: Authentication-related repository.
  - **current_weather_service**: Service for fetching current weather data.

- **routes**: Handles app routing using AutoRoute.
  - **app_router**: Manages the app's routes.
  - **app_router.gr**: AutoRoute generated route helpers.

- **utils**: Contains utility functions or widgets.
  - **custom_button**: Custom button widgets.
  - **error_screen**: Screen for displaying errors.
  - **loading_screen**: Screen for displaying loading state.

- **firebase_options**: Possibly contains configurations related to Firebase services.

This folder structure keeps the code organized and enhances maintainability and scalability.

### SOLID Principles

The app's architecture aligns with SOLID principles:
- **Single Responsibility Principle (SRP)**: Each folder seems to have a specific responsibility or concern, ensuring clarity in code organization and maintenance.
- **Dependency Inversion Principle (DIP)**: There might be abstractions/interfaces used for interacting with Firebase and external APIs, promoting flexibility and testability.
