require "rails_helper"

RSpec.describe "search index" do 
  it "displays information about the closest station to a given address" do 
    visit root_path
    select("Griffin Coffee", from: :location)
    click_button "Find Nearest Station"

    expect(current_path).to eq(search_path)

    expect(page).to have_content("Edgewater Public Market - Tesla Supercharger")
    expect(page).to have_content("5505 W 20th Ave")
    expect(page).to have_content("ELEC")
    expect(page).to have_content("24 hours daily")
  end

  it "provides driving directions for two given addresses" do 
    visit root_path
    select("Griffin Coffee", from: :location)
    click_button "Find Nearest Station"

    expect(current_path).to eq(search_path)

    expect(page).to have_content("0.699")
    expect(page).to have_content("00:02:22")
    expect(page).to have_content("Head east on W 25th Ave")
    expect(page).to have_content("Turn right. Go for 420 ft.")
  end
end
