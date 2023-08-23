#!/bin/bash
set -e

if [ "$#" -ne 1 ]; then
  # Store the output of ls command in a variable
  files=$(ls cypress/e2e/*.cy.js)

  # Iterate over the files using a for loop
  for file in $files; do
      # Spec command
      command="cypress run --spec \"$file\" --record false"
      # App name
      app_name=$(echo "$file" | awk -F'/' '{print $NF}' | sed -e 's/\.cy\.js$//')
      # Execute e2e test
      yarn start-test "Rscript run_example_app.R --app=$app_name" http://127.0.0.1:8888 "$command"
  done
else
  spec_path="cypress/e2e/$1.cy.js"
  command="cypress run --spec \"$spec_path\" --record false"
  yarn start-test "Rscript run_example_app.R --app=$1" http://127.0.0.1:8888 "$command"
fi

