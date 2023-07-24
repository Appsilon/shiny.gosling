const { defineConfig } = require("cypress");
const { initPlugin } = require('cypress-plugin-snapshots/plugin');

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
      initPlugin(on, config);     // this is cypress/plugins/index.js in Cypress v9
      return config;
    },
    excludeSpecPattern: [
      "**/__snapshots__/*",
      "**/__image_snapshots__/*"
    ]
  },
});
