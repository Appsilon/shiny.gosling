## Updating e2e tests
When adding new shiny app examples to the `inst/examples` folder we encourage you to add e2e tests for these example apps.

### Adding tests manually
You can add any e2e spec file manually. In order to catch these tests with the script that we'll use to run the e2e tests of shiny apps you only need to put the example Shiny apps in the `inst/examples` folder and create an e2e spec file under `tests/cypress/e2e` following the same name. For example if the newly created example app is named `myNewShinyApp` and is located at `inst/examples/myNewShinyApp` then the spec file should be named `tests/cypress/e2e/myNewShinyApp.cy.js`.

### Using `create_test_template.sh`

You can use the `tests/create_test_template.sh` to create a runnable e2e template test.
Let's use the script assuming that you have created an example shiny app in the `inst/examples` folder named `myNewShinyApp`

1. Go to the `tests/` folder
2. Run `create_test_template myNewShinyApp`. Note that the parameter passed to the script should be the name of the 
folder in which the example app was created. This will create a template spec file:
  a. An `.cy.js` spec file at `tests/cypress/e2e/myNewShinyApp.cy.js` that will contain a simple e2e snapshot test. You can 
add more tests to this file that are expected for your shiny app.
  
After running the script you would be able to run the following script for the newly created tests
```bash
# Run the e2e tests
run_cypress_tests.sh myNewShinyApp
```

### Running tests

**Running a single test**  
Given an example app named `myNewShinyApp` under the `inst/examples` folder and a spec file named `myNewShinyApp.cy.js` in the `tests/cypress/e2e` folder you can run the e2e tests for this app in the following way:
1. Go to the terminal
2. Run the following command (when located in the `tests/` folder)
```bash
# Run the e2e tests
run_cypress_tests.sh myNewShinyApp
```

**Running all of the e2e tests**
1. Go to the terminal
2. Run the following command (when located in the `tests/` folder)*
```bash
# Run the e2e tests
run_cypress_tests.sh
```
<small>***Note that we are running the same exact command without specifying an example app name**</small>
