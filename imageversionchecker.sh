deployment=$1
version=$(head -n 1 launchpad/$deployment/version.txt)
version_text=$(gcloud artifacts docker images list us-central1-docker.pkg.dev/cosmic-bonus-358914/den/$deployment --include-tags --format=json | grep -o '"tags": "[^"]*'  | grep -o '[^"]*$')
if [ "$version_text" == "$version" ]; then
    echo "Both Strings are Equal." && exit 125
else
    echo "Both Strings are not Equal."
fi
