# third_proj2

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# How flutter flow works

#### -> Here's a summary of the flow

1. **`late` Keyword:**
   - `late` is used to declare a variable that will be initialized at a later point, ensuring that it's assigned a value before it's used.

2. **`Future` for Asynchronous Operations:**
   - `Future` is used to represent a potential value or error that will be available at some time in the future. It's commonly used for asynchronous operations like network requests.

3. **`initState`:**
   - `initState` is called when a `StatefulWidget` is inserted into the widget tree, allowing you to perform one-time initialization, including initializing variables, particularly `late` variables that may involve asynchronous operations.

4. **`build`:**
   - `build` is called to create the elements of the user interface. It's where you construct the widget hierarchy based on the current state of the widget, including displaying data retrieved from a `Future`.

In practice, this is how it works:

- You use `late Future<Type> myFuture;` to declare a `late` variable named `myFuture` of type `Future<Type>`. This variable will hold a `Future` representing the asynchronous operation.

- Inside `initState`, you initialize `myFuture` by invoking an asynchronous operation (e.g., a network request) that returns a `Future`, and assign it to `myFuture`. This ensures that the `Future` is set up for later use in the widget.

- After the `Future` is initialized and the asynchronous operation completes, Flutter triggers a rebuild and calls the `build` method. Inside `build`, you use `FutureBuilder` to handle the different states of `myFuture` (e.g., loading, success, error) and construct the UI based on the `Future`'s result.

By utilizing this flow, you can handle asynchronous operations and display the appropriate UI based on the outcome of those operations in your Flutter application.

```

void fetchRecipes({String query = 'chicken'}) {
  // Function implementation
  print('Fetching recipes for query: $query');
}

void main() {
  // Calling the function with a named parameter
  fetchRecipes(query: 'pasta');
}

```

>In this example:

>The fetchRecipes function uses a named parameter query with a default value of 'chicken'.
Inside the main function, we call fetchRecipes and provide a specific query for pasta, overriding the default value.
When you run this, it will print:

``Fetching recipes for query: pasta``
