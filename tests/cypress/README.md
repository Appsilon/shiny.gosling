## Updating e2e tests
When adding new shiny app examples to the `inst/examples` folder we encourage you to add e2e tests for these example apps.

### Adding tests manually
You can add any e2e spec file manually. In order to catch these tests with the scripts that will collect all of the e2e tests defined in `package.json` and run them all you'll need to define the name of the script using the `e2e-` prefix <small>(See the [section](#running-everything))

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

### Running everything
**Using `run_cypress_tests.sh` and `update_run_all_tests.sh`**  
The scripts in `package.json` that are running e2e tests for each one of the example shiny apps are using the `e2e-` prefix in their scripts names. For example:  
```json
 "scripts": {
    "e2e-myNewShinyApp": "start-server-and-test myNewShinyApp http://127.0.0.1:8888 'cypress run --spec \"cypress/e2e/myNewShinyApp.cy.js\" --record false'",
    ...
  }
```
When you run the `update_run_all_tests` script in the terminal, this script looks for this pattern in the `package.json`>`scripts` and write them all in the `run_cypress_tests.sh` file prefixing it with the `yarn` command. This will create a file that will have a `yarn e2e-myNewShinyApp` line (following the abovementioned example) and all of the scripts that are following the `e2e-` prefix.
