Then(/^A new comment is created$/) do
  expect(@trev.comments.count).to eq(1)
end

When(/^sample comments have been created$/) do
  @comment = @corey.posts.last.comments.create(body: "Big butts", user: @trev)
end

When(/^The "([^"]*)" belongs to the current user$/) do |arg1|
  expect(@comment.user).to eq(@trev)
end

Then(/^The comment is updated$/) do
  expect(page).to have_content @comment
end

