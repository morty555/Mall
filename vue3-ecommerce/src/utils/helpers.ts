// src/utils/helpers.ts

export function formatCurrency(value: number): string {
    return `¥${value.toFixed(2)}`;
}

export function debounce<T extends (...args: any[]) => any>(func: T, delay: number) {
    let timeout: ReturnType<typeof setTimeout>;
    return function(this: any, ...args: Parameters<T>) {
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(this, args), delay);
    };
}

export function isEmpty(obj: object): boolean {
    return Object.keys(obj).length === 0;
}

export function getLocalStorageItem(key: string): any {
    const item = localStorage.getItem(key);
    return item ? JSON.parse(item) : null;
}

export function setLocalStorageItem(key: string, value: any): void {
    localStorage.setItem(key, JSON.stringify(value));
}

export function removeLocalStorageItem(key: string): void {
    localStorage.removeItem(key);
}
