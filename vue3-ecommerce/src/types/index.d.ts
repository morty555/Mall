// src/types/index.d.ts

// Type definitions for the e-commerce application

// User types
export interface User {
    id: number;
    username: string;
    email: string;
    token: string;
}

// Product types
export interface Product {
    id: number;
    name: string;
    description: string;
    price: number;
    stock: number;
    images: string[];
    category: string;
}

// Cart item type
export interface CartItem {
    productId: number;
    quantity: number;
}

// Order types
export interface Order {
    id: number;
    userId: number;
    items: CartItem[];
    total: number;
    address: string;
    status: string;
}

// Response types
export interface ApiResponse<T> {
    success: boolean;
    data: T;
    message?: string;
}