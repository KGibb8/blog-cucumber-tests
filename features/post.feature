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

  # Scenario: A user destroys an existing post
  #   Given a user is logged in
  #     And they are on the edit page
