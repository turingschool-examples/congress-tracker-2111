class CongressFacade
  def self.members(state)
    json = CongressService.members_of_house(state)

    json[:results].map do |member_data|
      Member.new(member_data)
    end
  end

  def self.senate_search(query)
    member_data = CongressService.senate

    # binding.pry
    members = member_data[:results][0][:members]
    found_members = members.find_all { |m| m[:last_name] == query }

    return nil unless found_members.present?

    Member.new(found_members.first)
  end
end
