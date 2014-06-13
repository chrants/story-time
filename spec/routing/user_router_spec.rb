require 'spec_helper'

describe "User Routes" do
  context "User" do
    it "gets login" do
      expect(:get => "/login").to route_to(
        :controller => "user",
        :action     => "show_login"
      )
    end

    it "posts login" do
      expect(:post => "/login").to route_to(
        :controller => "user",
        :action     => "login"
      )
    end

    it "gets logout" do
      expect(:get => "/logout").to route_to(
        :controller => "user",
        :action     => "logout"
      )
      expect(:post => "/logout").to route_to(
        :controller => "user",
        :action     => "logout"
      )
    end

    it "gets user home" do
      expect(:get => "/user/home").to route_to(
        :controller => "user",
        :action     => "home"
      )
      expect(:get => "/user/index").to route_to(
        :controller => "user",
        :action     => "home"
      )
    end
  end
end