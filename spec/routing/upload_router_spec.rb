require 'spec_helper'

describe "Upload Routes" do
  context "Upload" do
    it "gets upload page" do
      expect(:get => "/upload").to route_to(
        :controller => "uploads",
        :action     => "new"
      )
      expect(:get => "/uploads/new").to route_to(
        :controller => "uploads",
        :action     => "new"
      )
    end

    it "gets uploads page" do
      expect(:get => "/uploads").to route_to(
        :controller => "uploads",
        :action     => "index"
      )
    end

    it "gets a download" do
      expect(:get => "/uploads/download/0").to route_to(
        :controller => "uploads",
        :action     => "download"
      )
    end
  end
end