require 'rails_helper'

RSpec.describe CongressService do
  context 'class methods' do
    context '#members_of_house' do
      it 'returns member data' do
        search = CongressService.members_of_house("CO")

        expect(search).to be_a Hash
        expect(search[:results]).to be_a Array
        member_data = search[:results].first

        expect(member_data).to have_key :name
        expect(member_data[:name]).to be_a String

        expect(member_data).to have_key :role
        expect(member_data[:role]).to be_a String

        # expect(member_data.keys).to eq([:name, :role, :district, :party])
      end
    end
  end
end
