# How the Package is generated

The `Package.swift` and `Sources` files are automatically generated via a [script](https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/blob/master/.scripts/package.sh), which is set to run in a scheduled cron job via Github Actions. 

The script performs the following actions:
- Downloads the latest release from https://github.com/firebase/firebase-ios-sdk
- Parses the Firebase.zip to generate Package.swift and Sources/
- Commits changes on a new branch and creates a PR
- Creates a draft release, with a tag that mirrors the Firebase release. The draft release includes the assets needed for the swift package

## Running the script locally
- Install github cli: `$ brew install gh`
- Generate the swift package: `$ cd .scripts && sh package.sh debug skip-release`

## Testing locally
There is an iOS Example project that can be used to test that the Package is working as expected.
- Open the `iOS Example.xcworkspace`
- Build and run in XCode
  - Examples currently available for testing:
    - Firestore
    - In App Messaging
    - Google Sign In 

# Contribution Guidelines
Any and all input is welcome, including:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Questions, criticisms, concerns, etc.

## Pull Requests
1. Fork the repo and create your branch from `master`.
2. Make your code changes.
3. Update the README documentation if needed.
4. Create the pull request.

## Issues
Report a bug by [opening a new issue](https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/issues). Include steps to reproduce the error (and if possible sample code is always appreciated). To help with reproducing and testing issues there is an example project included in this repo: https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/tree/master/iOS%20Example

## License
By contributing, you agree that your contributions will be licensed under the project's [MIT License](http://choosealicense.com/licenses/mit/).
