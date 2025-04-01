# Shopi - Product Catalog App

A Flutter application that displays a list of products from the DummyJSON API with infinite scrolling and product details.

## Features

- Product list with infinite scrolling
- Product details view
- Clean Architecture implementation
- State management with Riverpod
- Error handling
- Responsive design

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/shopi.git
```

2. Navigate to the project directory:
```bash
cd shopi
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── core/                      # Core components
│   ├── constants/             # App constants
│   ├── errors/                # Error handling
│   ├── network/               # Network configuration
│   ├── routes/                # Route management
│   ├── theme/                 # App theme
│   ├── utils/                 # Utilities
│   └── widgets/               # Shared widgets
├── features/                  # Feature modules
│   └── products/              # Products feature
│       ├── data/              # Data layer
│       ├── domain/            # Domain layer
│       └── presentation/      # Presentation layer
└── main.dart                  # App entry point
```

## Architecture

This project follows Clean Architecture principles:

- **Data Layer**: Contains repositories implementations and data sources
- **Domain Layer**: Contains business logic, entities, and use cases
- **Presentation Layer**: Contains UI components and state management

## Dependencies

- flutter_riverpod: State management
- http: Network requests
- dartz: Functional programming features

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
