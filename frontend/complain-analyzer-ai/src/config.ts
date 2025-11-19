// API Configuration
export const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://13.204.77.196:5001';

export const config = {
  api: {
    baseURL: API_BASE_URL,
    mlBaseURL: import.meta.env.VITE_ML_API_URL || 'http://13.204.77.196:5002',
    timeout: 30000, // 30 seconds
  },
  // Add other configuration options here
} as const;
