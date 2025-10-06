# Setup

1. [Create a Docker Registry Repo](https://console.cloud.google.com/artifacts/create-repo) - choose `europe-west8` for the region.
2. Click "Copy Path" and put the path in `scripts/config.sh`, updating any other variables that need updating.
3. Run `npm run build`
4. Run `sh scripts/build_and_push.sh v1`
5. Run `sh scripts/deploy.sh v1 staging`
