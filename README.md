# Flutter Recipe App using Edamam Food Recipe API

This Flutter app allows users to access a collection of recipes using the Edamam Food Recipe API. It provides a user-friendly interface to browse, search, and view various recipes for a delightful cooking experience.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Recipe Search:** Users can search for recipes based on specific ingredients, cuisine, diet, meal type, and more.
- **Detailed Recipe Information:** Users can view detailed information about each recipe, including ingredients, instructions, and nutritional facts.
- **Interactive UI:** An intuitive and appealing user interface for an enhanced user experience.
- **API Integration:** Utilizes the Edamam Food Recipe API to fetch recipe data.



## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/) installed on your machine.
- [Edamam Food Recipe API credentials](https://developer.edamam.com/edamam-recipe-api) (App ID and App Key).

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/siddhu12980/Food_recipe_app.git

2. Navigate to the project directory:
   
   ```bash
   cd Food_recipe_app

3. Install dependencies:
   
   ```bash
   flutter pub get

4. Configure the API credentials:
  
  - Create a new file `secret.dart` inside the lib 
  directory
  - Inside `secret.dart`, define the API credentials
    
    ```bash
    const String edamamAppId = 'YOUR_APP_ID';
    const String edamamAppKey = 'YOUR_APP_KEY';

# Usage

1. Run the app:
  
    ```bash
    flutter run

2. Open the app on your emulator or device to explore and search for recipes.

# Contributing 

> Contributing
Contributions are welcome! Feel free to open issues or pull requests for any improvements or features you'd like to add.
