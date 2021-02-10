fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios test_all
```
fastlane ios test_all
```
Runs all the tests for StackOverflow
### ios reset_simulators
```
fastlane ios reset_simulators
```
This kills the Simulator process, and reset all simulators with Snapshot
### ios test_stackoverflow
```
fastlane ios test_stackoverflow
```
Runs all the tests for StackOverflow
### ios test_coverage_stackoverflow
```
fastlane ios test_coverage_stackoverflow
```
Run all the tests for StackOverflow + Coverage

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
