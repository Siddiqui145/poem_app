# 📜 Poem App — Clean Architecture & BLoC Pattern

A Flutter application that fetches and displays poems by selected authors from the [PoetryDB API](https://poetrydb.org/author). The app uses **Clean Architecture** principles and the **BLoC (Business Logic Component)** pattern to handle state management and API integration.

---

## 📱 Features

- 🔽 Fetch and display a **list of authors** via dropdown.
- 📖 Fetch and show **poems written by the selected author**.
- 🔁 Dynamically **change the author** and fetch new poems in real-time.
- 📦 Built with **Flutter + Dart**, using **BLoC pattern** and **Clean Architecture** best practices.
- 🌐 Asynchronous API calls using the `http` package.

---

## 🧠 Architecture Overview

This app strictly follows the **Clean Architecture** layered structure:

```

lib/
└── src/
└── features/
└── poem/
├── data/
│   ├── models/          # JSON model classes
│   ├── repositories/    # Implementation of domain repositories
│   └── sources/         # Remote data sources (API calls)
├── domain/
│   ├── entities/        # Core business objects
│   ├── repositories/    # Abstract repository interfaces
│   └── usecases/        # Application business logic
├── presentation/
│   ├── bloc/            # BLoC, Events, States
│   └── screens/         # UI (Widgets)

````

---

## 🧩 Packages Used

| Package                | Purpose                             |
|------------------------|-------------------------------------|
| `flutter_bloc`         | State management using BLoC pattern |
| `http`                 | REST API integration                |

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Siddiqui145/poem_app.git
cd poem_app
````

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
flutter run
```

---

## 🔁 App Flow

1. On app launch, a list of authors is fetched from `https://poetrydb.org/author`.
2. The user selects an author from the dropdown.
3. The app fetches and displays that author’s poems.
4. The user can change the author at any time, and the UI updates accordingly.

---

## 📂 Clean Architecture Layer Responsibilities

### ✅ Data Layer

* `PoemRemoteDataSource`: Makes HTTP calls and parses JSON.
* `PoemRepositoryImpl`: Implements `PoemRepository` using the data source.

### ✅ Domain Layer

* `PoemEntity`: Represents core data structures (title, lines).
* `PoemRepository`: Abstract class defining required operations.
* `GetPoemUseCase`, `GetAuthorsUseCase`: Handles business logic.

### ✅ Presentation Layer

* `PoemBloc`: Handles state and events.
* `PoemScreen`: UI with `BlocBuilder`, `DropdownButton`, and `ListView`.

---

## 📸 Demo

https://github.com/user-attachments/assets/3f505ff4-8a5f-47f1-a8e2-61abefd3b6cf

---

## ✨ Example APIs Used

* Get all authors:

  ```
  GET https://poetrydb.org/author
  ```

* Get poems by author:

  ```
  GET https://poetrydb.org/author/{author_name}
  ```

---

## 🙌 Contribution

Contributions are welcome! Please open issues or submit pull requests to enhance features or improve architecture.

---

## 🔒 License

This project is open-source and available under the [MIT License](LICENSE).

---

## 👨‍💻 Developed By

**Siddiqui Taha** — [@Siddiqui145](https://github.com/Siddiqui145)

---

### 💬 Have Suggestions?

Feel free to raise an issue or reach out for improvements or feature requests!
