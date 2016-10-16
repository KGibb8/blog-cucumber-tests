Given(/^a user has signed up$/) do
  visit new_user_registration_path

  fill_in 'Email', with: Faker::Internet.email
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'

  # save_and_open_page
  click_button 'Sign up'
end

Given(/^they have created some posts$/) do
  @user = User.last
  @user.posts << Post.new(body: Faker::Lorem.paragraph)
  @user.posts << Post.new(body: Faker::Lorem.paragraph)
end

When(/^they visit their posts index page$/) do
  @user = User.last
  visit user_posts_path @user
end

Then(/^they should see all of their posts$/) do
  post1 = @user.posts[0]
  post2 = @user.posts[1]
  expect(page).to have_content(post1.body)
  expect(page).to have_content(post2.body)
end
