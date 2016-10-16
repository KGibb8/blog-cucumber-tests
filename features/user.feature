Feature: User
  @wip
  Scenario: A user views all their posts
    Given a user has signed up
      And they have created some posts
    When they visit their posts index page
    Then they should see all of their posts
