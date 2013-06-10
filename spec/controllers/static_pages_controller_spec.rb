require 'spec_helper'

describe StaticPagesController do

  describe "GET 'signin'" do
    it "returns http success" do
      get 'signin'
      response.should be_success
    end
  end

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

end
