class CongressService
  def self.members_of_house(state)
    # Manage the response and results somewhere else; maybe a Service?
    # conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
    #   faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    # end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.senate
    Rails.cache.fetch('senate members') do
      binding.pry
      response = conn.get("/congress/v1/116/senate/members.json")

      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.conn
    Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    end
  end
end
