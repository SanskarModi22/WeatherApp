# Nova Weather App

## Install the APK

You can install the Nova Weather App on your Android device by downloading the APK file from the following link:

<!-- [Download Nova Weather App APK](https://drive.google.com/file/d/13tXM2MisO4tMfSzgp3VckGtatceKZcF8/view?usp=sharing) -->

NOTE: As told, The UI is very basic. Focused mostly on code quality and modularization.
## Screen Recording

To get an overview of the Nova Weather App's features and functionality, you can watch a screen recording by following this link:

<!-- [View Screen Recording](https://drive.google.com/file/d/1Vym0SE_-0Bba-e1hfiVrmY_5SJYWl51B/view?usp=sharing) -->

## Packages/Imports Used

The Nova Weather App utilizes the following packages and imports for its functionality:

- `cupertino_icons: ^1.0.2`: Provides access to icons in the Cupertino style, enhancing the app's visual elements.

- `dio: ^5.3.3`: Handles network requests and communication with the OpenWeather API for weather data retrieval.

- `flutter_riverpod: ^2.4.5`: Enables state management using the MVVM architecture and Riverpod for a smooth user experience.

- `http: ^1.1.0`: Used for making HTTP requests, playing a key role in network communication between the app and external services.

- `flutter_dotenv: ^5.1.0`: Manages environment variables securely, storing sensitive information like API keys within the app.

- `firebase_core: ^2.21.0`: Essential for initializing Firebase services, enabling Firebase functionality within the app.

- `firebase_auth: ^4.12.1`: Implements user authentication through Firebase, allowing users to log in securely.

- `google_sign_in: ^6.1.5`: Provides authentication via Google accounts, enabling users to sign in with their Google credentials.

- `flutter_svg: ^2.0.9`: Renders SVG images in the app, enhancing the visual experience with vector graphics.

## Architecture Followed

Nova Weather App follows the MVVM (Model-View-ViewModel) architecture, separating concerns into different aspects:

- **Model:** Represents the data model, including the structure for weather data and core data entities.

- **View:** Represents the user interface (UI) elements, including the login page, home page, and visual components.

- **ViewModel:** Acts as a bridge between the Model and View, providing central data management and communication.

Riverpod is used for state management, ensuring a clean and maintainable codebase that promotes scalability and code quality.

## API Usage

The app relies on the OpenWeather API to retrieve weather data for specified cities. Users enter a city name, and the app fetches weather information for that location. Key aspects related to API usage:
```dart
https://api.openweathermap.org/data/2.5/weather?id={city id}&appid={API key}
```
- The project separates API-related logic from the UI, promoting a modular and clean code structure. The `ApiClient` file contains functions for making API requests, while API keys are securely stored in environment variables.

## Authentication

Authentication within Nova Weather App is handled through Google Sign-In, using Firebase. The project includes the following components to manage authentication states:

- **Authentication Provider:** Responsible for authentication methods and user information.

- **Authentication State Provider:** Manages states such as loading, errors, the login page, and the home page. This provider tracks the user's authentication status.

- **AuthChecker:** Orchestrates these authentication-related components, ensuring a smooth user experience by handling login and navigation between the login page and home page based on the user's authentication status.

## Folder Structure

<!-- ![Folder structure](https://i.ibb.co/p0JBzCN/Screenshot-2023-11-07-at-3-42-03-AM.png) -->

The Nova Weather App project has a well-structured folder organization for a clear separation of different components. The structure may look as follows:

- **Views:** Contains the various screens of the app, including the login page, home page.

- **Core:** Houses core functionality, including authentication, constants, and utilities.

- **Models:** Contains the data models, such as weather data.

- **Repository:** Contains the code for calling the API through given params.

- **ViewModels:** Includes the view models that bridge the gap between the UI and data, using the MVVM architecture.

- **Widgets:** Contains reusable widgets, such as custom buttons and error screens.

This folder structure keeps the code organized and enhances maintainability and scalability.


