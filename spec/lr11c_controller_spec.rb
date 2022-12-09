require 'spec_helper'
require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe Lr11cController do

  include RSpec::Expectations
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = 'http://localhost:3000/'
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
end



RSpec.describe Lr11cController, type: :request do
  describe "get index page" do
    context "check index page by root" do
      it 'has code 200' do
        get 'http://localhost:3000/'
        expect(response).to have_http_status(:success)
        expect(response.status).to eq(200)
      end
    end
  end
end



RSpec.describe "Result table management attempt №3",:js => true, :type => :system do
  before do
    driven_by(:selenium_chrome_headless)
    Capybara.default_max_wait_time = 5
  end

  let (:output) {[1, 5, 6, 25]}

  it "user pushed correct number and table created with correct output" do
    visit "/"
    fill_in "number", with: "100"
    click_button ("Найти")
    all("table tr td").each_with_index{|val, ind| if (ind - 1) % 3 == 0 then expect(val).to have_text(output[(ind-1)/3]) end}
  end
end