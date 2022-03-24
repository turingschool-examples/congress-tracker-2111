require 'rails_helper'

RSpec.describe Member do
  it 'exists' do
    attributes = {
      name: "Leslie Knope",
      district: "1",
      role: "Representative",
      party: "Pizza"
    }

    member = Member.new(attributes)

    expect(member).to be_a Member
    expect(member.name).to eq("Leslie Knope")
    expect(member.district).to eq("1")
    expect(member.role).to eq("Representative")
    expect(member.party).to eq("Pizza")
    expect(member.name).to eq(attributes[:name])
  end
end
