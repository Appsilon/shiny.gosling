## Updating e2e tests
When adding new shiny app examples to the `inst/examples` folder

### Using `create_tests_templates.sh`

You can use the `tests/cypress/create_tests_templates.sh` to create a runnable e2e template test.
Let's use the script assuming that you have created an example shiny app in the `inst/examples` folder named `myNewShinyApp`

1. Go to the `tests/cypress` folder
2. Run `create_tests_templates myNewShinyApp`. Note that the parameter passed to the script should be the name of the 
folder in which the app was created. This will create two files and add the scripts to the `package.json` file  
  a. An `.R` file at: `tests/cypress/r_scripts/run_myNewShinyApp.R` that will run a Shiny app
  b. An `.cy.js` spec file at `tests/cypress/e2e/myNewShinyApp.cy.js` that will contain a simple e2e snapshot test. You can 
add more tests to this file that are expected for your shiny app.
  c. A line in `package.json` that will run the shiny app.
  d. A line in the `package.json` file that will run the e2e test for that Shiny app.

After running the script you would be able to run the following scripts for the newly created Shiny apps
```bash
# Run the Shiny app
yarn myNewShinyApp

# Run the e2e tests
yarn e2e-myNewShinyApp
```