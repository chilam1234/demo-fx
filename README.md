# demo FX

A very simple FX app demo.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to run it
1. Run `flutter pub get` to install the packages
2. Prepare `google-services.json` and `GoogleService-info.plist` for firebase service usage
   [ios please see here:](https://firebase.flutter.dev/docs/manual-installation/ios/)
   [android please see here:](https://firebase.flutter.dev/docs/manual-installation/android)
3. Provide your vantage endpoint and apikey to .env file
4. Open your emulator
   -IOS please type `open -a Simulator.app` in terminal 
5. Run `flutter run` in the current project folder root


## Development Process and Planning


### 1. Understand the requirements and the effort estimation
    Since time is tight and there are quite a number of deliverables,with the limited knowledge on mobile development. I decided to do the significant tasks (impactful to user first).

    After estimation, I decided not to do some tasks:
    1. Have an overview of the losses and gains in their portfolio
    2. Share the financial instrument with external parties.

    as overview requirement is too board to me and sharing also

### 2. Decide framework to use
    I want to learn something while doing the challenge so after consulting my mobile dev friends I decided to pick flutter as my framework as it is platform agnostics and it is easier to maintain compared to React native


### 3. Flutter ,Firebase and Vantage API setup and trial
   As they are all new to me, I need to set up the runnable project with the basic dependencies installed first. I took some flutter course like Fireship and suggestions from my friend to have a basic understanding of flutter and what packages are needed for completing the feature. 
   I also need to test the firebase setup and vantage api call to figure out what services and api end-points I need to fulfill the user story. 

### 4. Development
   I will call it a trial and error process since I am not familiar with Dart language, but the dart refactoring tool in Vs Code does help a lot cause they have auto code sinppet completion for widget and stuff.
   But the Vantage api is not providing a good developer experience as it has rate limiting which is very little ( 5 calls a minute ). I need to wait to test feature and instrument details, add/remove and some of the JSON keys don't make sense , say `'1. symbol'` as a key which cause extra effort to map those key.  As for the firebase OTP phone auth, I took some time to try to make it work with the testing phone but it didn't. Cannot get the verification id and cannot simulate code send so I decided just to mock up the screen.


### 5. testing
   Sorry since time is limited I only do a simple test on stock service, will add it to todo list