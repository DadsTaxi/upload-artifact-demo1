#These script requires GitHub CLI - each line can run on any platform
# Installation of GitHub CLI: https://github.com/cli/cli#installation

echo "list all Artifacts for a repo"
gh api -H "Accept: application/vnd.github+json" /repos/DadsTaxi/upload-artifact-demo1/actions/artifacts

echo "list all artifacts for a repo in a nice format"
gh api -H "Accept: application/vnd.github+json" /repos/DadsTaxi/upload-artifact-demo1/actions/artifacts --jq '.artifacts[] | {name, created_at, size_in_bytes, id} 

echo "list all artifacts for a repo in a nice format which were created since 2023-01-02 23:40 UTC
gh api -H "Accept: application/vnd.github+json" \
/repos/DadsTaxi/upload-artifact-demo1/actions/artifacts --jq '.artifacts[] | {name, created_at, size_in_bytes, id} | select (.created_at > "2023-01-02T23:40")'
