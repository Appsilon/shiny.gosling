#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <custom_text>"
    exit 1
fi

custom_text="$1"
cy_spec_out="$1.cy.js"
r_script_out="run_$1.R"
package_json=../package.json
default_port=8888

# Escape special characters in the custom_text to use in sed
escaped_custom_text=$(printf '%s\n' "$custom_text" | sed -e 's/[\/&]/\\&/g')

# Replace with sed
cat "r_scripts/template.R" | sed "s/<<<var_1>>>/$escaped_custom_text/g"  >> r_scripts/$r_script_out
cat "e2e/template.template" | sed "s/<<<var_1>>>/$escaped_custom_text/g"  >> e2e/$cy_spec_out

rscript_command="Rscript cypress/r_scripts/$r_script_out $default_port"
e2e_command="start-server-and-test $escaped_custom_text http://localhost:$default_port 'cypress run --spec \"cypress/e2e/$cy_spec_out\" --record false'"

echo $rscript_command
# Add the entry to scripts section in package.json
jq --arg script_name "$escaped_custom_text"\
 --arg rscript_command "$rscript_command"\
 --arg e2e_command "$e2e_command" \
  '.scripts += {
    ($script_name): ($rscript_command),
    ("e2e-" + $script_name): ($e2e_command)
  }' \
  "$package_json" > temp_package.json && mv temp_package.json "$package_json"


echo "r_scripts/$r_script_out created"
echo "e2e/$cy_spec_out created"
echo "package.json updated"
