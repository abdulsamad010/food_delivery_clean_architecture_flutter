# 🍔 Food Delivery App — Flutter

![Flutter](https://img.shields.io/badge/Flutter-Framework-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-Language-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![BLoC](https://img.shields.io/badge/BLoC-State%20Management-7B1FA2?style=for-the-badge)
![Clean Architecture](https://img.shields.io/badge/Clean%20Architecture-121212?style=for-the-badge)
![Android](https://img.shields.io/badge/Platform-Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)

> A modern Flutter food delivery application built with Clean Architecture and BLoC state management.

**OWASoft Technologies Pvt. Ltd. — Flutter Developer Internship — Week 8**

---

## 📌 Overview

**Food Delivery App** is a Flutter-based food delivery application developed as a Week 8 internship project at **OWASoft Technologies Pvt. Ltd.**

The project focuses on implementing a modern food delivery application interface while organizing the code using:

- Flutter & Dart
- Clean Architecture
- BLoC state management
- Reusable widgets
- Responsive UI
- Network-based images
- Structured dummy food data

The application contains multiple food-delivery-related flows, including food discovery, restaurants, categories, cart, payment, orders, tracking, profile, notifications, chat, calling, and authentication screens.

---

## ✨ Features

| Feature | Description |
| --- | --- |
| 🏠 Home | Browse food categories, restaurants and food items |
| 🍔 Categories | Browse All, Burger, Pizza, Breakfast, Pasta and Lunch |
| 🍽️ Restaurants | View restaurant information and available food |
| 🔎 Food Discovery | View food images, prices, ratings and descriptions |
| 🛒 Cart | View items and update quantities |
| 💳 Payment | Payment and card-related screens |
| ✅ Order Confirmation | Order confirmation interface |
| 📍 Order Tracking | Delivery and order tracking interface |
| 👤 Profile | User profile interface |
| 🔔 Notifications | Notification interface |
| 💬 Chat | Messaging interface |
| 📞 Calling | Calling interface |
| 🔐 Authentication | Login, signup and forgot-password screens |
| 🎨 Modern UI | Clean and responsive Flutter interface |
| 🧱 Clean Architecture | Presentation, Domain and Data layers |
| 🔄 BLoC | Centralized application state management |
| 🌐 Network Images | Food and restaurant images loaded from URLs |

---

## 🏗️ Architecture

The project follows a simple Clean Architecture structure:

```text
lib/
├── presentation/
│   ├── screens/
│   ├── widgets/
│   ├── bloc/
│   └── theme/
│       └── app_colors.dart
│
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
│
└── main.dart
```

### 🟣 Presentation Layer

Responsible for the user interface and interaction.

Contains:

- Screens
- Reusable widgets
- BLoC events
- BLoC states
- Application theme and colors

### 🔵 Domain Layer

Contains the core application structure.

Contains:

- Entities
- Repository contracts
- Use cases

The Domain layer defines what the application needs without directly depending on the Data implementation.

### 🟢 Data Layer

Responsible for providing application data.

Contains:

- Data sources
- Models
- Repository implementations

---

## 🔄 Data Flow

The food data follows this flow:

```text
Food Data
    ↓
Data Source
    ↓
Food Model
    ↓
Repository Implementation
    ↓
Repository Contract
    ↓
GetFoods Use Case
    ↓
AppBloc
    ↓
AppState
    ↓
Flutter UI
```

This structure keeps data handling separated from the user interface.

---

## 🧠 BLoC State Management

The project uses **BLoC** to manage application state.

```text
User Action
    ↓
AppEvent
    ↓
AppBloc
    ↓
Application Logic
    ↓
AppState
    ↓
UI Rebuild
```

The main application BLoC handles areas such as:

- Food data
- Category selection
- Cart data
- Cart quantity updates
- Application state changes

---

## 🍔 Food Categories

The application currently includes:

```text
1. All
2. Burger
3. Pizza
4. Breakfast
5. Pasta
6. Lunch
```

Category selection is connected with the BLoC state so the selected category can be reflected in the UI.

---

## 🍕 Food Data

Food records contain structured information such as:

```text
ID
Name
Restaurant
Restaurant ID
Category
Price
Rating
Reviews
Delivery Fee
Delivery Time
Image
Description
Ingredients
Available Sizes
```

Example:

```dart
{
  "id": 1,
  "name": "Pizza Calzone European",
  "restaurantId": 1,
  "restaurant": "Uttora Coffee House",
  "category": "Pizza",
  "price": 32.0,
  "rating": 4.7,
  "reviews": 120,
  "deliveryFee": 0.0,
  "deliveryTime": "20 min",
  "image": "IMAGE_URL",
  "description": "Food description",
  "ingredients": [],
  "sizes": []
}
```

---

## 🛒 Cart

The cart flow provides:

- Selected food items
- Food prices
- Selected sizes
- Quantity controls
- Cart total
- Checkout navigation

The cart uses a cart-item ID together with the related food ID.

---

## 💳 Payment & Order Flow

```text
Cart
  ↓
Payment
  ↓
Add Card
  ↓
Order Confirmation
  ↓
Track Order
```

The payment section contains interfaces for payment selection and adding card information.

> This project focuses on the application interface and internship implementation. It does not represent a production payment gateway integration.

---

## 📍 Order Tracking

The order tracking screen provides a delivery-status interface with:

- Delivery information
- Tracking UI
- Expandable tracking panel
- Order progress presentation

---

## 💬 Communication Features

### 💬 Chat

Provides a messaging interface where users can enter and send messages.

### 📞 Calling

Provides a dedicated calling interface.

### 🔔 Notifications

Provides a centralized notification interface.

---

## 👤 Profile

The profile section provides an account-oriented interface for user information and profile-related navigation.

---

## 🔐 Authentication

The project includes the following authentication-related interfaces:

- Login
- Signup
- Forgot Password

These screens provide the UI foundation for an authentication flow.

---

## 🎨 UI & Theme

The application uses a modern food delivery design with:

- 🟠 Orange primary accent
- ⚪ White surfaces
- ⚫ Dark text and surfaces
- 🩶 Light grey UI elements
- Rounded containers
- Rounded cards
- Category selection states
- Network images
- Responsive sizing

### Main Colors

```text
Orange       #FF6B00
Dark Orange  #E85D04
Light Orange #FFE5D0
White        #FFFFFF
Light Grey   #F5F5F5
Grey         #BDBDBD
Dark Grey    #757575
Light Blue   #D7E5E8
Yellow       #FFC107
Golden       #FFB300
Dark Blue    #1A1329
Black        #000000
```

---

## 📱 Application Screens

The project contains feature-based screen folders:

```text
presentation/screens/

├── calling/
├── card/
├── cart/
├── category_post_details/
├── category_posts/
├── chat/
├── forget_password/
├── home/
├── login/
├── notification/
├── onboarding/
├── order_confiremd/
├── payment/
├── profile/
├── restaurant/
├── signup/
├── splash/
└── track/
```

---

## 🧩 Reusable Widgets

Reusable UI components are stored inside:

```text
lib/presentation/widgets/
```

The project includes a reusable custom:

```text
InputField
```

for consistent form-field styling.

---

## 📦 Technologies

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white)
![BLoC](https://img.shields.io/badge/flutter__bloc-7B1FA2?style=flat-square)
![ScreenUtil](https://img.shields.io/badge/flutter__screenutil-FF6B00?style=flat-square)
![SVG](https://img.shields.io/badge/flutter__svg-546E7A?style=flat-square)

### Main Packages

- `flutter_bloc` — state management
- `flutter_screenutil` — responsive sizing
- `flutter_svg` — SVG asset support

Dependency versions are maintained in:

```text
pubspec.yaml
pubspec.lock
```

---

## 🖼️ Assets

```text
assets/
├── icons/
└── images/
```

The assets include:

- Navigation icons
- Cart icons
- Payment icons
- Chat and calling icons
- Notification-related icons
- Order tracking icons
- Food images
- Supporting application images

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone <YOUR_REPOSITORY_URL>
```

### 2. Open the project

```bash
cd food_delivery_clean_architecture_flutter
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

---

## 🛠️ Development Workflow

The Week 8 implementation was organized into separate Git commits covering:

- Data layer
- Domain layer
- BLoC
- Theme
- Reusable widgets
- Home
- Restaurant
- Categories
- Authentication
- Cart
- Payment
- Orders
- Profile
- Communication
- Tracking
- Assets
- Project configuration

This keeps the Git history structured and makes individual development stages easier to understand.

---

## 🎯 Project Goals

The main goals of this project were:

1. Implement the provided food delivery application design.
2. Practice Flutter UI development.
3. Understand Clean Architecture.
4. Separate Presentation, Domain and Data responsibilities.
5. Practice BLoC state management.
6. Build reusable Flutter widgets.
7. Implement multiple application flows.
8. Improve Git and GitHub workflow through organized commits.

---

## 🧠 Concepts Practiced

- Flutter UI development
- Dart programming
- Clean Architecture
- BLoC state management
- Events and states
- Repository pattern
- Use cases
- Domain entities
- Data models
- Dummy data sources
- Network images
- Form fields
- Dropdown buttons
- Navigation
- Cart management
- Quantity management
- Responsive UI
- SVG assets
- Reusable widgets
- Git and GitHub

---

## 🔮 Future Improvements

Possible future extensions include:

- 🔐 Real authentication
- 🌐 REST API integration
- 🗄️ Backend database
- 💳 Real payment gateway
- 📍 Real-time delivery tracking
- 🔔 Push notifications
- 🛒 Persistent cart
- ⭐ Real reviews and ratings
- 💬 Real-time chat
- 📞 Real calling functionality
- 🔎 Advanced search and filtering
- 📦 Real order management

---

## 👨‍💻 Internship Information

![OWASoft Technologies](https://img.shields.io/badge/OWASoft%20Technologies%20Pvt.%20Ltd.-Flutter%20Internship-FF6B00?style=for-the-badge)

| Detail | Information |
| --- | --- |
| **Role** | Flutter Developer Intern |
| **Project** | Food Delivery App |
| **Week** | 8 |
| **Technology** | Flutter & Dart |
| **Architecture** | Clean Architecture |
| **State Management** | BLoC |

---

## 📄 License

This project was developed for internship and learning purposes.

---

<p align="center">

**🍔 Building clean interfaces, one feature at a time.**

Made with ❤️ using Flutter & Dart

</p>
