module.exports = {
  root: true,
  env: {
    node: true
  },
  plugins: [
    'vue', 'prettier'
  ],
  extends: [
    'plugin:vue/recommended', 'plugin:prettier/recommended'
  ],
  rules: {
    "no-console": process.env.NODE_ENV === "production"
      ? "error"
      : "off",
    "no-debugger": process.env.NODE_ENV === "production"
      ? "error"
      : "off",
    'prettier/prettier': [
      'error', {
        "trailingComma": "all",
        "singleQuote": true,
        "printWidth": 120
      }
    ]
  },
  parserOptions: {
    parser: "babel-eslint"
  }
};
