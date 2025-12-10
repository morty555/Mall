# Vue 3 E-commerce Platform

## Overview
This project is a fully functional e-commerce platform built with Vue 3, utilizing the Composition API. It features a modern design and a responsive user interface powered by Element Plus. The application is structured to provide a seamless shopping experience, including user authentication, product management, a shopping cart, and order processing.

## Technologies Used
- **Frontend Framework**: Vue 3
- **State Management**: Pinia
- **Routing**: Vue Router 4
- **HTTP Client**: Axios
- **Build Tool**: Vite
- **UI Component Library**: Element Plus

## Project Structure
```
vue3-ecommerce
├── public
│   └── index.html
├── src
│   ├── main.ts
│   ├── App.vue
│   ├── assets
│   │   └── styles
│   │       └── main.css
│   ├── router
│   │   └── index.ts
│   ├── stores
│   │   ├── index.ts
│   │   ├── user.ts
│   │   ├── product.ts
│   │   ├── cart.ts
│   │   └── order.ts
│   ├── services
│   │   ├── axios.ts
│   │   ├── api
│   │   │   ├── auth.ts
│   │   │   ├── product.ts
│   │   │   ├── cart.ts
│   │   │   └── order.ts
│   ├── pages
│   │   ├── Home.vue
│   │   ├── Login.vue
│   │   ├── Register.vue
│   │   ├── ProductList.vue
│   │   ├── ProductDetail.vue
│   │   ├── Cart.vue
│   │   ├── Checkout.vue
│   │   ├── Orders.vue
│   │   └── OrderDetail.vue
│   ├── components
│   │   ├── common
│   │   │   ├── Header.vue
│   │   │   ├── Footer.vue
│   │   │   └── Pagination.vue
│   │   ├── product
│   │   │   ├── ProductCard.vue
│   │   │   └── ProductGallery.vue
│   │   └── cart
│   │       └── CartItem.vue
│   ├── layouts
│   │   ├── DefaultLayout.vue
│   │   └── AuthLayout.vue
│   ├── composables
│   │   └── useAuth.ts
│   ├── utils
│   │   └── helpers.ts
│   ├── types
│   │   └── index.d.ts
│   └── styles
│       └── element-variables.scss
├── tests
│   └── unit
│       └── example.spec.ts
├── .env
├── .gitignore
├── package.json
├── tsconfig.json
├── vite.config.ts
├── .eslintrc.cjs
├── .prettierrc
└── README.md
```

## Features
1. **User Module**:
   - Login and registration functionality.
   - Token management for authentication (stored in localStorage or cookies).
   - Route guards to protect certain routes (e.g., Cart, Orders).

2. **Product Module**:
   - Display a list of products with pagination.
   - Search and filter products by category.
   - Detailed product view with images, specifications, and pricing.

3. **Cart Module**:
   - Add products to the shopping cart.
   - Modify product quantities and remove items.
   - Automatic total price calculation.

4. **Order Module**:
   - Submit orders with shipping information.
   - Manage shipping addresses (add, delete, modify).
   - View order history and details.

## Getting Started
1. Clone the repository:
   ```
   git clone <repository-url>
   cd vue3-ecommerce
   ```

2. Install dependencies:
   ```
   npm install
   ```

3. Run the development server:
   ```
   npm run dev
   ```

4. Open your browser and navigate to `http://localhost:3000`.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.