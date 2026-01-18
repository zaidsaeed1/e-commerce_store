This project is a short assignment designed to demonstrate real-world Flutter development skills, focusing on clean architecture, API integration, and state management. It uses the FakeStoreAPI to simulate a functional e-commerce backend.

Project Structure:

The app follows a modular MVVM folder structure:

lib/core: Contains API constants, the Dio network client, and secure token storage.

lib/data: Includes models (Cart, Product, User) and services for API communication.

lib/presentation: Houses Cubits for state logic and Views for the UI screens.



Features Implemented:

Authentication: Secure login using /auth/login with token storage.

Product Listing: Fetches and displays products with images, titles, and prices.

Category Filtering: Users can filter products by category.

Product Details: Detailed view with full descriptions and "Add to Cart" functionality.

Cart Management: Users can view items, adjust quantities, and see totals.

User Profile: Displays user-specific data like name, email, and address.

State Handling: Includes dedicated states for loading, error handling, and empty data.


How to Run the App:

Clone the repository to your local machine.

Ensure you have the Flutter SDK installed and configured.

Run flutter pub get in the terminal to install dependencies (Dio, Flutter_Bloc, etc.).

Connect a device or emulator and run flutter run.
