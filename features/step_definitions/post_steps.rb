Given(/^sample users have been created$/) do
  @corey = User.create(email: "corey@gmail.com", password: "123456")
  @trev = User.create(email: "trevor@gmail.com", password: "123456")
end

Given(/^sample posts have been created$/) do
  @post = @corey.posts.create(title: "Buttocks", body: "We all love buttocks!")
  @current_post_count = @corey.posts.count
end


Given(/^They have logged in as "([^"]*)"$/) do |email|
  @user = User.find_by(email: email)
  page.set_rack_session('warden.user.user.key' => User.serialize_into_session(@user))
end

When(/^They navigate to the "([^"]*)" page$/) do |page|
  visit get_named_route(page)
end

When(/^They navigate to the specific "([^"]*)" page$/) do |page|
  visit get_named_route(page, @corey.posts.last)
end

When(/^They fill in the "([^"]*)" field with "([^"]*)"$/) do |label, content|
  fill_in label, with: content
end

When(/^They press "([^"]*)"(?: on "([^"]*)"|)$/) do |key, css_selector|
  css_selector ||= 'body'
  case key
  when "ENTER"
    keycode = 13
  when "TAB"
    keycode = 9
  when "SPACE"
    keycode = 32
  end
  keypress_script = "var e = $.Event('keydown', { keyCode: #{keycode}  }); $('#{css_selector}').trigger(e);"
  page.driver.execute_script(keypress_script)
end


When(/^They click "([^"]*)"$/) do |this|
  click_on this
end

When(/^They click "([^"]*)" on "([^"]*)"$/) do |button, css_selector|
  within(:css, css_selector) do
    click_on button
  end
end

# When(/^They click "([^"]*)"(?: on "([^"]*)"|)$/) do |this, css_selector|
#   css_selector ||= 'body'
#   if this == "Edit Comment"
#     binding.pry
#     within(:css, css_selector) do
#       click_on this
#     end
#   end
#   click_on this
# end

Then(/^A new post is created$/) do
  @post = @user.posts.last
  expect(@user.posts.count).to eq(@current_post_count + 1)
end

Then(/^They are redirected to the "([^"]*)" page$/) do |page|
  expect(current_path).to eq(get_named_route(page))
end

Then(/^The page contains "([^"]*)"$/) do |content|
  # save_and_open_page
  binding.pry
  expect(page).to have_content(content)
  save_and_open_page
end

Then(/^They are redirected to the specific "([^"]*)" page$/) do |page|
  expect(current_path).to eq(get_named_route(page, @corey.posts.last))
end


Then(/^The page contains "([^"]*)" in "([^"]*)"$/) do |content, css_selector|
  within(:css, css_selector) do
    expect(page).to have_content(content)
  end
end

Then(/^The post is deleted$/) do
  expect(@user.posts.count).to eq(@current_post_count - 1)
end

Then(/^The deleted post should not be present$/) do
  expect(page).to_not have_content(@post)
  save_and_open_page
end


# Given(/^sample users have been created$/) do
#   User.create(email: "corey@gmail.com", password: "123456")
#   User.create(email: "trevor@gmail.com", password: "123456")
# end

# Given(/^they are on the new posts page$/) do
#   visit new_post_path
# end

# Given(/^a post exists$/) do
#   @user = User.create(email: Faker::Internet.email, password: "password", password_confirmation: "password")
#   @user.posts.create(body: Faker::Lorem.paragraph)
# end

# Given(/^They have logged in as "([^"]*)"$/) do |email|
#   @user = User.find_by(email: email)
#   page.set_rack_session('warden.user.user.key' => User.serialize_into_session(@user).unshift("User"))
# end

# When (/^They navigate to the "([^"]*)" page$/) do |page|
#   visit get_named_route(page)
# end

# When(/^They fill in the "([^"]*)" field with "([^"]*)"$/) do |label, content|
#   fill_in label, with: content
# end

# Given(/^a user is signed in$/) do
#   @user = User.create(email: Faker::Internet.email, password: "password", password_confirmation: "password")
#   visit new_user_session_path
#   fill_in 'Email', with: @user.email
#   fill_in 'Password', with: 'password'
#   click_button 'Log in'
# end

# Given(/^they have a post$/) do
#   @post = @user.posts.create(body: Faker::Lorem.paragraph)
# end

# Given(/^they are on the post page$/) do
#   visit post_path @post
# end

# When(/^they fill in the relevant fields$/) do
#   @description = Faker::Lorem.paragraph
#   fill_in 'Body', with: @description
# end

# When(/^they click on the "([^"]*)" button$/) do |button|
#   click_button button
# end

# When(/^they are on the page of the post in question$/) do
#   visit post_path @user.posts.last
# end

# When(/^they make changes to the post$/) do
#   @new_description = Faker::Lorem.paragraph
#   fill_in 'Body', with: @new_description
# end

# Then(/^a new post should be created$/) do
#   expect(Post.last.body).to eq @description
# end

# Then(/^they can see the post$/) do
#   expect(page).to have_content @user.posts.last.body
# end

# Then(/^they can see the updated post$/) do
#   expect(page).to have_content @new_description
# end

# Then(/^they can no longer see the post$/) do
#   expect(page).to_not have_content @post
# end

# When(/^They click the "([^"]*)" button$/) do |button|
#   click_on button
# end

# Then(/^A new post is created$/) do
#   expect(@user.posts.count).to eq(1)
# end

# Then(/^They are redirected to the "([^"]*)" page$/) do |path|
#   expect(current_path).to eq(get_named_route("posts"))
#   # expect(page).to include Post.all.map(&:body)
# end

# Then(/^The page contains "([^"]*)"$/) do |content|
#   expect(page).to have_content(content)
# end

# Then(/^The page contains "([^"]*)" in "([^"]*)"$/) do |content, css_selector|
#   within(:css, css_selector) do
#     expect(page).to have_content(content)
#   end
# end
