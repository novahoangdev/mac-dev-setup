/** Tailwind config for the guide. Build: bash scripts/build-css.sh */
module.exports = {
  content: ['./index.html'],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        brand: { 500: '#10b981', 600: '#059669' },
        surface: { 800: '#1e293b', 900: '#0f172a', 950: '#020617' },
        accent: { cyan: '#06b6d4', purple: '#a855f7', amber: '#f59e0b', rose: '#f43f5e' },
      },
      fontFamily: {
        mono: ['"JetBrains Mono"', 'ui-monospace', 'monospace'],
        sans: ['Inter', 'system-ui', '-apple-system', 'sans-serif'],
      },
    },
  },
};
