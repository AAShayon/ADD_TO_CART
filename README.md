## Flutter Add to Cart
This project demonstrates a simple add-to-cart functionality in a Flutter application. It includes fetching menu items from an API, displaying them in a list, and calculating the subtotal, VAT, and total amounts dynamically based on the items added to the cart.

![intro](intro.gif)

## Features
    Fetch menu items from an API and display them in a list.
    Increment and decrement item counts for each menu item.
    Calculate and display the subtotal, VAT, and total amounts dynamically.
    User-friendly UI with animations and visual feedback
       
     lib/
        ├── main.dart
        ├── model/
        │   ├── core/
        │   │   ├── api_urls.dart
        │   │   ├── response_model/
        │   │   │   └── all_menu_item_response_body_model.dart
        │   ├── service/
        │   │   ├── remote/
        │   │   │   ├── api_error_handler.dart
        │   │   │   ├── api_response.dart
        │   │   │   └── dio_service.dart
        ├── utils/
        │   ├── colors.dart
        │   └── text_styles.dart
        ├── view/
        │   └── add_to_cart_screen.dart
        └── viewModel/
        └── food_view_model.dart
 
