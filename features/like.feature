Feature: Like
  As a logged in user, I should be able to like a post
  As a logged in user, I should be able to see that I have liked a post
  As a logged in user, I should be able to see all posts I have liked
  As a logged in user, I should be able to unlike a post

  Background:
    Given sample users have been created
    Given sample posts have been created
    Given They have logged in as "corey@gmail.com"

  @wip
  @poltergeist
  Scenario: Corey likes Trevor's post
    When They navigate to the specific "post" page
    And They click "Like"
    Then A new like is created
    And The page contains "Liked"

  Scenario: Corey unlikes Trevor's post
    When They navigate to the specific "post" page
    And They click "Like"
    Then The like is deleted
    And The page contains "Like"
