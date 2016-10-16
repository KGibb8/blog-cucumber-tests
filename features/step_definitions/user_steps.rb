Given(/^a user has signed up$/) do
  visit new_user_registration_path

  fill_in 'Email', with: Faker::Internet.email
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'

  # save_and_open_page
  click_button 'Sign up'
end

Given(/^they have created some posts$/) do
  user = User.last
  user.posts << Post.new(body: Faker::Lorem.paragraph)
  user.posts << Post.new(body: Faker::Lorem.paragraph)
end

When(/^they visit their posts index page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^they should see all of their posts$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
