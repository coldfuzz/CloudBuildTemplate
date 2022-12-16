deployment=$1
version=$(head -n 1 launchpad/$deployment/version.txt)
version_text=$(gcloud artifacts docker images list us-central1-docker.pkg.dev/cosmic-bonus-358914/quickstart-docker-repo/$deployment --include-tags --format=json | jq --raw-output '.[].tags' | grep -w  $version)
[[ $version_text = $version ]] && echo "equal" && exit 125
