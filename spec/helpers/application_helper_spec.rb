require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ApplicationHelper do
  pending "#alert_snippet"

  pending "#now"

  pending "#time_of"

  it "#upload_path" do
    expect(upload_path).to eq("/upload")
  end

  pending "gets appropriate path for an upload #uploads_path"

  pending "#user_path"

  it "gets the appropriate #users_path" do
    expect(users_path(User.new(id: 10))).to eq("/users/10")
    expect(users_path).to eq("/users")
  end

  it "gets the appropriate #home_url" do
    expect(home_url(User.new(type: User))).to eq("/user/home")
    expect(home_url(User.new(type: Member))).to eq("/member/home")
    expect(home_url(User.new(type: BetaMember))).to eq("/member/home")
    expect(home_url(User.new(type: Admin))).to eq("/admin/home") 
  end

  pending "#host"

  pending "gets an appropriate #thumbnail_for an upload"
end
