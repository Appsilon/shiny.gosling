#!/bin/bash
grep -o 'e2e-[a-zA-Z0-9]*' ../package.json | sed 's/^/yarn /' >> ../run_cypress_tests.sh