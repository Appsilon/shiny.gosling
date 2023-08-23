#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <custom_text>"
    exit 1
fi

custom_text="$1"
cy_spec_out="$1.cy.js"

# Escape special characters in the custom_text to use in sed
escaped_custom_text=$(printf '%s\n' "$custom_text" | sed -e 's/[\/&]/\\&/g')

# Replace with sed
cat "cypress/e2e/template.template" | sed "s/<<<var_1>>>/$escaped_custom_text/g"  >> cypress/e2e/$cy_spec_out

echo "cypress/e2e/$cy_spec_out created"
