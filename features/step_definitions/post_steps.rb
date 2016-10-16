Given(/^they are on the new posts page$/) do
  visit new_post_path
end

Given(/^a post exists$/) do
  @user = User.create(email: Faker::Internet.email, password: "password", password_confirmation: "password")
  @user.posts.create(body: Faker::Lorem.paragraph)
end

When(/^they fill in the relevant fields$/) do
  @description = Faker::Lorem.paragraph
  fill_in 'Body', with: @description
end

When(/^they click on the "([^"]*)" button$/) do |button|
  # save_and_open_page
  click_button button
end

When(/^they are on the page of the post in question$/) do
  visit post_path @user.posts.last
end

Then(/^a new post should be created$/) do
  expect(Post.last.body).to eq @description
end

Then(/^they can see the post$/) do
  save_and_open_page
  expect(page).to have_content @user.posts.last.body
end
