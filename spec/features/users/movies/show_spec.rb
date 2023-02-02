require 'rails_helper'

RSpec.describe 'The Movie Details (Show) Page', type: :feature do
  let!(:movie1) {51888}
  let!(:user1) { User.create!(name: "Anthony", email: "anthony@gmail.com") }
  let!(:user2) { User.create!(name: "Thomas", email: "thomas@gmail.com") }
  let!(:user3) { User.create!(name: "Jessica", email: "jessica@gmail.com") }
  
  describe 'the page basics' do
    it 'has a button to return to Discover Page' do
      stub_request(:get, "https://api.themoviedb.org/3/movie/51888?api_key").
      to_return(status: 200, body: File.read("spec/fixtures/robot_chicken_response.json"), headers: {})

      visit user_movie_path(user1, movie1)

      expect(page).to have_button("Discover Page")

      click_button("Discover Page")

      expect(current_path).to eq(user_discover_index_path(user1))

      expect(page).to have_content("#{user1.name}'s Discover Movies Page")
    end

    xit 'has a button to create a viewing party' do
    end
  end

  describe 'The Movie Information' do
    it 'will list all the movies information' do
      stub_request(:get, "https://api.themoviedb.org/3/movie/51888?api_key").
      to_return(status: 200, body: File.read("spec/fixtures/robot_chicken_response.json"), headers: {})

      visit user_movie_path(user1, movie1)

      expect(page).to have_content("Robot Chicken: Star Wars Episode III")
      expect(page).to have_content(7.4)
      expect(page).to have_content("0:45")
    end
  end
end