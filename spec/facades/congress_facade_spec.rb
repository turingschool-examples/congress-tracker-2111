require 'rails_helper'

RSpec.describe CongressFacade do
  it ".members" do # it '.members', :vcr do if using vcr
    members = CongressFacade.members('CO')

    expect(members).to be_a Array
    members.each do |member|
      expect(member).to be_a Member
      # expect(member.name).to eq("name here")
    end
  end
end
