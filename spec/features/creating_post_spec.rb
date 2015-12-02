require 'rails_helper'

feature 'Creating Post' do 
  let!(:post) { build :post }

  scenario 'with valid data' do
    visit new_post_path

    fill_in 'Name', with: post.name
    fill_in 'Content', with: post.content

    click_button 'Create Post'

    expect(page).to have_content 'New post added'
  end

  scenario 'with invalid data' do
    visit new_post_path

    fill_in  'Name', with: nil
    fill_in 'Content', with: nil

    click_button 'Create Post'

    expect(page).to have_content 'Failed Posting'
  end

end