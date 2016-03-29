require "pakyow_helper"

RSpec.describe "Links", type: :feature do
  def rom
    Pakyow::Config.app.rom
  end

  def create_link(attributes)
    attributes = attributes.merge(created_at: Time.now, updated_at: Time.now)
    rom.command(:links).create.call(attributes)
  end

  def delete_all_links
    # TODO this sure isn't very intention revealing...
    rom.command(:links).delete.call
  end

  after do
    # TODO probably better to use database cleaner or
    # something than manually deleting these...
    delete_all_links
  end

  describe "viewing links" do
    it "displays all links" do
      create_link(url: "http://google.com")
      create_link(url: "http://iamvery.com")
      create_link(url: "http://youtube.com")

      visit "/links"

      expect(page).to have_content("iamvery.com")
      expect(page).to have_content("google.com")
      expect(page).to have_content("youtube.com")
    end
  end

  describe "creating link" do
    it "adds the link to the index" do
      # TODO are there path helper methods in pakyow
      visit "/links"

      fill_in "Url", with: "http://iamvery.com"
      click_on "Create link"

      expect(page).to have_content("iamvery.com")
    end
  end

  describe "deleting link" do
    it "removes the link from the index" do
      create_link(url: "http://iamvery.com")

      # TODO are there path helper methods in pakyow
      visit "/links"

      click_on "×"

      expect(page).not_to have_content("iamvery.com")
    end
  end
end
