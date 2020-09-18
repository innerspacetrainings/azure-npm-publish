# Azure NPM Publish

GitHub action to automatically publish a NPM package into Azure Artifacts

## Setup

Create the file `.github/workflows/azure-npm-publish.yml` with the following content:

```yaml
name: Azure Publish

on:
  push:
    tags:
      - 'v*' # Push events to matching v*, i.e. v1.0, v20.15.10

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: innerspacetrainings/azure-npm-publish@master
        env:
          REPO: ${{ github.repository }}
        with:
          package-dir: 'Custom/directory'
          npm-email: 'my-microsoft@email.com'
          organization: 'organization/url'
          feed: 'feed-name'
          username: 'anything-for-the-logs'
          base64-token: ${{ secrets.AZURE_TOKEN }}
```

### Configuration

For reference, I do recommend you to know how to set up the .npmrc file following [Microsoft's documentation](https://docs.microsoft.com/en-us/azure/devops/artifacts/get-started-npm?view=azure-devops&tabs=windows#set-up-your-npmrc-files).

The fields here the following:

| Field          | Required | Description                                                                      |
| -------------- |:--------:| :------------------------------------------------------------------------------- |
| `package-dir`  | false    | The path for the `package.json` if it is not in root                             |
| `npm-email`    | true     | Required email to upload the npm package                                         |
| `organization` | true     | Value which replaces `<yourOrganization>` in the .npmrc file                     |
| `feed`         | true     | Value which replaces `<yourFeed>` in the .npmrc file                             |
| `username`     | true     | Any value but not an empty string                                                |
| `base64-token` | true     | Value which replaces `[BASE64_ENCODED_PERSONAL_ACCESS_TOKEN]` in the .npmrc file |