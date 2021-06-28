
# SpaceX GraphQL

A project created in flutter using GetX. Project supports both web and mobile.

## Getting Started

This app follows the guidelines of clean architecture, TDD and dependency injection.
The purpose is to search the SpaceX missions done by calling the GraphQL query "launches"

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/christianarduino/getx_spacex.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

This project uses `json_serializable` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```


### Libraries & Tools Used

* [Graphql](https://pub.dev/packages/graphql)
* [Get](https://pub.dev/packages/get)
* [Json Serializable](https://pub.dev/packages/json_serializable)

### Folder Structure
Here is the core folder structure which flutter provides.

```
getx_spacex/
|- android
|- build
|- ios
|- lib
|- test
|- web
```

Here is the folder structure I have been using in this project

```
lib/
|- src/
|- resources/
```
