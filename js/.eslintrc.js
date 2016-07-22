module.exports = {
  extends: 'airbnb',
  parser: 'babel-eslint',
  rules: {
    'new-cap': ['warn', { newIsCap: true, capIsNew: false }],
    'no-unused-vars': ['error', { argsIgnorePattern: "^_" }],

    'react/prefer-stateless-function': 'warn',
  },
}
