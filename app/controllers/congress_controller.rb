class CongressController < ApplicationController

  def index
    @members = CongressFacade.members(params[:state])
    # connection to API is repeated twice in controller
    # This should probably live somewhere else; maybe a Facade?
    # conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
    #   faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    # end
    #
    # # Manage the response and results somewhere else; maybe a Service?
    # response = conn.get("/congress/v1/members/house/#{state}/current.json")
    #
    # json = JSON.parse(response.body, symbolize_names: true)

    # @members = json[:results].map do |member_data|
    #   Member.new(member_data)
    # end

    render "welcome/index"
  end

  def search
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    end
    response = conn.get("/congress/v1/116/senate/members.json")

    data = JSON.parse(response.body, symbolize_names: true)

    members = data[:results][0][:members]

    found_members = members.find_all {|m| m[:last_name] == params[:search]}
    @member = found_members.first
    render "welcome/index"
  end
end
