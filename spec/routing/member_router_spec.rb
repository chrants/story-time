require 'spec_helper'

describe "Member Routes" do
  context "Member" do
    it "gets member home" do
      expect(:get => "/member/home").to route_to(
        :controller => "member",
        :action     => "home"
      )
    end
  end
end