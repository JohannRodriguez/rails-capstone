require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Users', type: :feature do
  before(:each) { User.new(name: 'Evelynn').save }

  it 'Ensures user login' do
    visit new_session_path
    fill_in 'session_name', with: 'Evelynn'
    find("input[type='submit']").click
    expect(page).to have_content('LOGOUT')
  end

  it 'Ensures user redirection when successfully login' do
    visit new_session_path
    fill_in 'session_name', with: 'Evelynn'
    find("input[type='submit']").click
    expect(page).to have_current_path(root_path)
  end

  it "Ensures user doesn't inputs an existing name to login" do
    visit new_session_path
    fill_in 'session_name', with: 'Willyberto'
    find("input[type='submit']").click
    expect(page).to have_content('Invalid username')
  end

  it "Ensures user can't create user if the name already exists" do
    visit new_user_path
    fill_in 'user_name', with: 'Evelynn'
    find("input[type='submit']").click
    expect(page).to have_content('Invalid username')
  end

  it 'Ensures redirection when creates a new user' do
    visit new_user_path
    fill_in 'user_name', with: 'Willyberto'
    find("input[type='submit']").click
    expect(page).to have_content('User successfully created')
  end
  # rubocop:enable Metrics/BlockLength
end
