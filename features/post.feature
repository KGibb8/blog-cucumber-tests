Feature: Posts
  Scenario: A user creates a new post with a body
    Given a user has signed up
     And they are on the new posts page
    When they fill in the relevant fields
      And they click on the "Create" button
    Then a new post should be created
