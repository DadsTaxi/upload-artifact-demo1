#These script requires GitHub CLI - each line can run on any platform
# Installation of GitHub CLI: https://github.com/cli/cli#installation

# NOTE to use these scripts in your repository you need to replace DadsTaxi/upload-artifact-demo1/ with OWNER/REPO/

echo "list all Artifacts for a repo"
gh api -H "Accept: application/vnd.github+json" /repos/DadsTaxi/upload-artifact-demo1/actions/artifacts

echo "list all artifacts for a repo in a nice format"
gh api -H "Accept: application/vnd.github+json" /repos/DadsTaxi/upload-artifact-demo1/actions/artifacts --jq '.artifacts[] | {name, created_at, size_in_bytes, id, url} 

echo "list all artifacts for a repo in a nice format which were created before 2023-01-02 23:29 UTC
gh api -H "Accept: application/vnd.github+json" \
/repos/DadsTaxi/upload-artifact-demo1/actions/artifacts --jq '.artifacts[] | {name, created_at, size_in_bytes, id} | select (.created_at < "2023-01-02T23:29")'

echo "list all artifacts for a repo in a nice TSV format which were created before 2023-01-02 23:29 UTC
gh api -H "Accept: application/vnd.github+json" \
/repos/DadsTaxi/upload-artifact-demo1/actions/artifacts --jq '.artifacts[] | select (.created_at < "2023-01-02T23:29") | [.name, .created_at, .size_in_bytes, .id, .url] | @tsv'

#delete using the API https://docs.github.com/en/rest/actions/artifacts?apiVersion=2022-11-28
echo delete artifacts older than 2023-01-02 23:40 UTC.  - verify carefully then update the command "echo gh api" on the second line to "gh api" to execute 
gh api -H "Accept: application/vnd.github+json" \
"/repos/DadsTaxi/upload-artifact-demo1/actions/artifacts" --jq '.artifacts[] | select (.created_at < "2023-01-02T23:29") | [.id] | @tsv' | \
 xargs -L1 -I'{}' echo gh api --method DELETE '/repos/DadsTaxi/upload-artifact-demo1/actions/artifacts/{}'





