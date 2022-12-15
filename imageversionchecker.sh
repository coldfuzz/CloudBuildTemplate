deployment=$1
version=$(head -n 1 launchpad/$deployment/version.txt)
version_text=$(gcloud artifacts docker images list europe-west2-docker.pkg.dev/kaluza-analytics-prod/launchpad/$deployment --include-tags --format=json | jq --raw-output '.[].tags' | grep -w  $version)
[[ $version_text = $version ]] && echo "equal" && exit 125
