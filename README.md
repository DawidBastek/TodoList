# TodoList

MyTodoList is a Todo app with local authentication and UserDefaults as a database.

### Getting started

#### Requirements
1. Xcode 13 or higher
2. iOS 15 or higher

#### How to install
1. Clone the repo
2. Run `MyTodo.xcodeproj` file

### General Notes

#### Views
All views are written in SwiftUI and placed in `Views` catalogue.

#### Alert messages
The text can be found in `TodoError`, `LoginError` and `TodoError` enums, you can use these to assert the contents of the alerts.

### Tasks

Create a new branch and complete the following tasks on that branch.

1. Create automated UI tests for the following scenarios:
    * Create Account
        * Username cannot be empty
        * Password cannot be empty
        * Password and Repeat Password do not match
        * Username is already taken
        * Create account with success
    * Login
        * Username cannot be empty
        * Password cannot be empty
        * Authentication failed
    * Add new todo
        * Title cannot be empty
        * Add new todo from "Add something" button
        * Add new todo from "Add" button
    * TodoList
        * Text when no todos are available    
        * Mark Todo as done (tap on the todo)
        * Todo is not done
        * Delete Todo (swipe to delete)
    * Extra task
        * Add possibility for clearing test data by using `LaunchArguments.append("clearLocalData")` parameter in tests
        
Finally feel free to modify the existing code to ease testability and submit pull requests if you have suggestions for improvements.

## Copyright
MIT License.
Created by @DawidBastek and @matulik
