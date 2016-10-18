Feature: Comment
  As a logged in user, I should be able to post a commend for any existing post
  As a logged in user, I should be able to edit my comment
  As a logged in user, I should be able to delete my comment

  @poltergeist
  Scenario: Trevor comments on Corey's post
    Given sample users have been created
    And They have logged in as "trevor@gmail.com"
    And sample posts have been created
    When They navigate to the specific "post" page
    And They fill in the "comment_body" field with "I'm no longer confused..."
    And They press "ENTER"
    Then The page contains "I'm no longer confused..."
    And A new comment is created

  @wip
  @poltergeist
  Scenario: A user edits their comment
    Given sample users have been created
    And They have logged in as "trevor@gmail.com"
    And sample posts have been created
    And sample comments have been created
    And The "comment" belongs to the current user
    When They navigate to the specific "post" page
    And They click "Edit Comment" on "#edit_comment_button"
    And They fill in the "edit_comment_body" field with "I love biiiiiiiig butts and i cannot lie!"
    And They press "ENTER" on "textarea"
    Then The page contains "I love biiiiiiiig butts and i cannot lie!"
    And The comment is updated
