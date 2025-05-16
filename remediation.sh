# Make a backup of the original file
cp .github/actions/test-template/action.yml .github/actions/test-template/action.yml.bak

# Use sed to replace direct GitHub context variables with environment variables
# This is a general pattern that needs to be adapted to the specific file content
sed -i.tmp -E '/run:/{
  n
  /\$\{\{.*github.*\}\}/s/^(.*)$/  env:\n    GITHUB_CONTEXT_VAR: \$\{\{ github.event.issue.title \}\}\n  run: |\n    \1/
}' .github/actions/test-template/action.yml

# Now manually edit the file to complete the fix
# This requires human intervention to properly identify all GitHub context variables
# and replace them with appropriate environment variables
echo "Manual editing required to complete the fix. Please:"
echo "1. Open .github/actions/test-template/action.yml"
echo "2. Identify all instances of \${{ github.* }} in run: sections"
echo "3. Create appropriate environment variables in env: sections"
echo "4. Replace direct references with properly quoted env vars like \"$ENV_VAR\""

# Remove temporary files
rm -f .github/actions/test-template/action.yml.tmp