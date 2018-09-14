require 'spec_helper'
require 'rails_helper'


feature 'signup' do
  background :each do
    visit new_user_path
  end
  
  it "has a signup button" do
    expect(page).to have_content('Sign Up')
  end
  
  it "takes a username and password" do
    expect(page).to have_content('Tell us yo username, yo!')
    expect(page).to have_content('Give us a star wars password!')
  end
  
  it "redirects to user show page and displays username" do
    fill_in 'username', with: 'Abra'
    fill_in 'password', with: 'Alakazam'
    click_button 'ME'
    expect(page).to have_content('Abra')
    user = User.find_by(username: 'Abra')
    expect(current_path).to eq(user_path(user))
  end
end

feature 'login' do
  background :each do
    visit new_session_path
  end
  
  it "has a login button" do
    expect(page).to have_content('Log In')
  end
  
  it "takes a username and password" do
    expect(page).to have_content('YO NAME!')
    expect(page).to have_content('DO YOU MEMBA?')
  end
  
  it "redirects to user show page and displays username" do
    fill_in 'YO NAME', with: 'tyler'
    fill_in 'DO YOU MEMBA?', with: 'password'
    click_button 'GET IN HERE!'
    expect(page).to have_content('tyler')
    user = User.find_by(username: 'tyler')
    expect(current_path).to eq(user_path(user))
  end
end