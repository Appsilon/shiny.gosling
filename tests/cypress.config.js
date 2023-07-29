const { defineConfig } = require("cypress");
const { initPlugin } = require("cypress-plugin-snapshots/plugin");

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
  env: {
    "cypress-plugin-snapshots": {
      "imageConfig": {
        "threshold": 5,             // Amount in pixels or percentage before snapshot image is invalid
        "thresholdType": "percent"     // Can be either "pixels" or "percent"
      },
    }
  }
});
