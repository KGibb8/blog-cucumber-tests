
Given(/^Corey likes Trevor's post$/) do
  binding.pry
  @trev.likes.create(post: @corey.posts.last)
end

Then(/^A new like is created$/) do
  binding.pry
  expect(@trev.likes.count).to eq(1)
end

When(/^They click the "([^"]*)" image$/) do |alt_text|
  find("img[alt='#{alt_text}']").click
end

Then(/^ The image contains "([^"]*)"$/) do |alt_text|
  find("img[alt='#{alt_text}']").click
end

Then(/^The like is deleted$/) do
  expect(@trev.likes.count).to eq(0)
end

Then(/^The image alt_text reads "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
