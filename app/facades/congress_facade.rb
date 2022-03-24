class CongressFacade
  def self.members(state)
    json = CongressService.members_of_house(state)

    json[:results].map do |member_data|
      Member.new(member_data)
    end
  end
end
