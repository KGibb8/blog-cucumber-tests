Feature: Post
  As a logged in user, i should be able to create new posts.
  As a logged in user, i should be able to see posts i created.
  As a logged in user, i should be able to edit my posts.
  As a logged in user, i should be able to delete my posts.

  Background:
    Given sample users have been created
    Given They have logged in as "corey@gmail.com"
    Given sample posts have been created


  Scenario: Corey creates a new post with a body
    When They navigate to the "new post" page
    And They fill in the "post_title" field with "Corey's big adventure"
    And They fill in the "post_body" field with "Corey goes to the store"
    And They click "Create"
    Then A new post is created
    And They are redirected to the "posts" page
    And The page contains "Corey goes to the store"
    And The page contains "Corey goes to the store" in ".posts"

  Scenario: Corey edits any one of his posts
    When They navigate to the specific "post" page
    And They click "Edit post"
    Then They fill in the "post_title" field with "Corey's new adventure"
    And They fill in the "post_body" field with "Corey goes to the future"
    And They click "Update"
    And They are redirected to the specific "post" page
    And The page contains "Corey's new adventure"

  Scenario: Corey deletes one of his posts
    When They navigate to the specific "post" page
    And They click "Delete post"
    Then The post is deleted
    And They are redirected to the "posts" page
    And The deleted post should not be present

  # Scenario: A user creates a new post with a body
  #   Given a user has signed up
  #   And they are on the new posts page
  #   When they fill in the relevant fields
  #   And they click on the "Create" button
  #   Then a new post should be created

  # Scenario: A visitor views a post
  #   Given a post exists
  #   When they are on the page of the post in question
  #   Then they can see the post

  # Scenario: A user edits their post
  #   Given a user is signed in
  #   And they have a post
  #   And they are on the post page
  #   When they click on the "Edit" button
  #   And they make changes to the post
  #   And they click on the "Save" button
  #   Then they can see the updated post

  # Scenario: A user destroys an existing post
  #   Given a user is signed in
  #   And they have a post
  #   And they are on the post page
  #   When they click on the "Delete" button
  #   Then they can no longer see the post

