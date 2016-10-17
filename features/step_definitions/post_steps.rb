Given(/^they are on the new posts page$/) do
  visit new_post_path
end

Given(/^a post exists$/) do
  @user = User.create(email: Faker::Internet.email, password: "password", password_confirmation: "password")
  @user.posts.create(body: Faker::Lorem.paragraph)
end

Given(/^a user is signed in$/) do
  @user = User.create(email: Faker::Internet.email, password: "password", password_confirmation: "password")
  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end

Given(/^they have a post$/) do
  @post = @user.posts.create(body: Faker::Lorem.paragraph)
end

Given(/^they are on the post page$/) do
  visit post_path @post
end

When(/^they fill in the relevant fields$/) do
  @description = Faker::Lorem.paragraph
  fill_in 'Body', with: @description
end

When(/^they click on the "([^"]*)" button$/) do |button|
  click_button button
end

When(/^they are on the page of the post in question$/) do
  visit post_path @user.posts.last
end

When(/^they make changes to the post$/) do
  @new_description = Faker::Lorem.paragraph
  fill_in 'Body', with: @new_description
end

Then(/^a new post should be created$/) do
  expect(Post.last.body).to eq @description
end

Then(/^they can see the post$/) do
  expect(page).to have_content @user.posts.last.body
end

Then(/^they can see the updated post$/) do
  expect(page).to have_content @new_description
end

Then(/^they can no longer see the post$/) do
  expect(page).to_not have_content @post
end

