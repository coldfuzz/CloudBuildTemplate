import subprocess
import sys

version_command = f"head -n 1 launchpad/{sys.argv[1]}/version.txt"
version = subprocess.getoutput(version_command)
image_command = f"gcloud artifacts docker images list europe-west2-docker.pkg.dev/kaluza-analytics-prod/launchpad/{sys.argv[1]} --include-tags --format=json | jq --raw-output '.[].tags' | grep -w  {version}"
result = subprocess.getoutput(image_command)

if result.split("\n")[2] == version.strip(" \n"):
    raise Exception("Image version already used")