import subprocess
import sys

version_command = f"head -n 1 launchpad/{sys.argv[1]}/version.txt"
version = subprocess.getoutput(version_command)
image_command = f"gcloud artifacts docker images list us-central1-docker.pkg.dev/cosmic-bonus-358914/kurt/{sys.argv[1]} --include-tags --format=json | jq --raw-output '.[].tags' | grep -w  {version}"
result = subprocess.getoutput(image_command)

if result.split("\n")[2] == version.strip(" \n"):
    raise Exception("Image version already used")
