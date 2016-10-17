Feature: Comments
  @wip
  Scenario:
    A user creates a new comment with a body
    Given a user is signed in
      And they have a post
      And they are on the post page
    When they fill in the comment relevant fields
      And they click on the "Create Comment" button
    Then a new comment should be created
