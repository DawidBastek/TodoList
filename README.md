# TodoList

MyTodoList is a Todo app with local authentication and UserDefaults as a database.

<img src="https://user-images.githubusercontent.com/72853287/174547795-cc07eea5-9d15-4d5c-be28-ccb52da10c1a.png" alt="LoginScreen" width=20% height=20%> <img src="https://user-images.githubusercontent.com/72853287/174547820-258887e0-35a3-4693-83ac-aaab02aeb014.png" alt="CreateAccountScreen" width=20% height=20%>
<img src="https://user-images.githubusercontent.com/72853287/174547829-131f3f4c-25df-4fac-8256-bb5da6312a00.png" alt="EmptyTodoListScreen" width=20% height=20%>
<img src="https://user-images.githubusercontent.com/72853287/174547867-e27f5472-ea97-4e38-ae69-3bee0d8f2ac4.png" alt="TodoListScreen" width=20% height=20%>
<img src="https://user-images.githubusercontent.com/72853287/174547880-14a94277-b7a3-4923-802a-524039d0ffe5.png" alt="AddTodoScreen" width=20% height=20%>

### Getting started

#### Requirements
1. Xcode 13 or higher
2. iOS 15 or higher

#### How to install
1. Fork the repo
2. Clone the repo
3. Run `MyTodo.xcodeproj` file

### General Notes

#### Views
All views are written in SwiftUI and placed in `Views` catalogue.

#### Alert messages
The text can be found in `TodoError`, `LoginError` and `TodoError` enums, you can use these to assert the contents of the alerts.

### Tasks

Create automated UI tests for the following scenarios:

    1. Create Account
        * Username cannot be empty
        * Password cannot be empty
        * Password and Repeat Password do not match
        * Username is already taken
        * Create account with success
    2. Login
        * Username cannot be empty
        * Password cannot be empty
        * Authentication failed
    3. Add new todo
        * Title cannot be empty
        * Add new todo from "Add something" button
        * Add new todo from "Add" button
    4. Todo list
        * Text when no todos are available    
        * Mark Todo as done (tap on the todo)
        * Todo is not done
        * Delete Todo (swipe to delete)
    5. Extra task
        * Add possibility for clearing test data by using `LaunchArguments.append("clearLocalData")` parameter in tests
        
Finally feel free to modify the existing code. The application is for you.

## Copyright
MIT License.
Created by @DawidBastek and @matulik
