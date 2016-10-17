Feature: Posts
  Scenario: A user creates a new post with a body
    Given a user has signed up
      And they are on the new posts page
    When they fill in the relevant fields
      And they click on the "Create" button
    Then a new post should be created

  Scenario: A visitor views a post
    Given a post exists
    When they are on the page of the post in question
    Then they can see the post

  Scenario: A user edits their post
    Given a user is signed in
      And they have a post
      And they are on the post page
      When they click on the "Edit" button
      And they make changes to the post
      And they click on the "Save" button
    Then they can see the updated post

  Scenario: A user destroys an existing post
    Given a user is signed in
      And they have a post
      And they are on the post page
    When they click on the "Delete" button
    Then they can no longer see the post

