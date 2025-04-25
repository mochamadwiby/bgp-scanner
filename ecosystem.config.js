module.exports = {
  apps: [
    {
      name: 'bgp-scanner',
      script: 'src/index.ts', // Path ke file hasil build TypeScript
      exec_mode: 'fork',
      instances: 'max', // Jalankan sebanyak mungkin instance berdasarkan jumlah CPU
      env: {
        NODE_ENV: 'production',
        PORT: 5500, // Port yang digunakan oleh aplikasi
      },
    },
  ],
};