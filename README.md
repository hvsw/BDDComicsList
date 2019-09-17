# Behaviour Driven Development Comics List App

# About
This app was developed to demonstrate the process of creating an iOS app using BDD techniques.

# Product Specs

## Initiative

Create an app that shows a list of Marvel comics and their characters so we can inform people who are not aware of Marvel stories.

## User Stories

### US01 - See a list of Marvel Comics
    As a user
    I want to see a list of Marvel Comics grouped by the first letter of the comic's title
    So I can get to know the comics they have

#### Acceptance criteria:

*Scenario: No internet connection:*

    Given that I don't have internet connection
    Then present a message informing that it can not present the list of comics

*Scenario: Internet connection OK, response fails:*

    Given that I have internet connection
    And the server response is wrong
    Then present an error message informing that the content couldn't be read

*Scenario: Internet connection OK, response succeed:*

    Given that I have internet connection
    And the server response is correct
    Then present a list of Marvel Comics grouped by the first letter of the comic's title
	And present the title of each comic

### US02 - See the list of characters of a given comic
	As a user
	I want to see the list of characters when I tap on a comic title
	So I can have more information about the comic

#### Acceptance criteria:

*Scenario: List of comics is presented:*

	Given that the list of comics is presented
	And I tap on a comic
	Then present a list with the name of the characters of that comic

### US03 - Fetch data UI indicator
	As a user
	I want to see a UI element indicating that the app is fetching new data
	So I know the data will be refreshed with new information

#### Acceptance criteria:

*Scenario: App is loading new data:*

	Given that the app is fetching data from the Marvel server
	Then present a UI activity indicator

*Scenario: App finished loading data:*

	Given that the app finished loading data
	Then hide the UI activity indicator

# Development steps

## 1. Create new targets for testing

When this project was created, the `Include Unit Tests` and `Include UI Tests` checkboxes weren't marked for educational purpose. We will do this manually here and will include an extra MacOS test target that will help us speed up writing tests. 

The MacOS test target builds way faster because it does not rely on other frameworks such as `UIKit`, and because of that, every time we run tests it will not have to compile resources like `xib` files neither will launch the app in the simulator.

### `BDDComicsListiOSTests` target
In Xcode, go to `File` -> `New target`. The `BDDComicsListiOSTests` name was given to this specific target. Note the `iOS` word within the target title: This is very important because we will include another MacOS test target