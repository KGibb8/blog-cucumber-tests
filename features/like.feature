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
  Scenario: Trevor likes Corey's post
    When They navigate to the specific "post" page
    And They click the "Like" image
    And A new like is created
    Then The image alt_text reads "Unlike"
    
  @wip
  @poltergeist
  Scenario: Trevor unlikes Corey's post
    Given Corey likes Trevor's post
    When They navigate to the specific "post" page
    And They click the "Unlike" image
    Then The like is deleted
    And The image alt_text reads "Like"
