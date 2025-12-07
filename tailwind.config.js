const withMT = require("@material-tailwind/html/utils/withMT");
 
module.exports = withMT({
  content: ['./{layouts,content,themes,src}/**/*.{md,html,js}', './node_modules/@material-tailwind/html/**/*.{js,jsx,ts,tsx}', // Add Material Tailwind paths
  "./index.html"],
  theme: {
    extend: {},
  },
  plugins: [],
});