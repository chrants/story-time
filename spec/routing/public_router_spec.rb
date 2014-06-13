require 'spec_helper'

describe "Public Routes" do
  context "Public" do
    it "gets home" do
      expect(:get => "/").to route_to(
        :controller => "public",
        :action     => "index"
      )
      expect(:get => "/index").to route_to(
        :controller => "public",
        :action     => "index"
      )
    end

    it "gets contact" do
      expect(:get => "/contact").to route_to(
        :controller => "public",
        :action     => "contact"
      )
    end
  end

  context "Uploads" do
    it "gets uploads" do 
      expect(:get => "/uploads").to route_to(
        :controller => "uploads",
        :action     => "index"
      )
    end
  end
end