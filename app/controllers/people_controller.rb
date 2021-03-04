# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :require_token

  def index
    token = ENV['SALESLOFT_TOKEN']
    url = 'https://api.salesloft.com/v2/people.json'
    response = HTTParty.get(url, headers: { 'Authorization' => "Bearer #{token}" })
    response_json = JSON.parse(response.body)
    people_data = response_json['data']
    people_array = people_data.map { |a| Person.new.from_json(a.to_json) }
    configure_variables(people_array)
  end

  private

  def require_token
    redirect_to error_index_path if ENV['SALESLOFT_TOKEN'].nil?
  end

  def configure_variables(people_array)
    gon.people_list = FormatPeopleListService.new(people_array).execute
    gon.frecuency_count = CalculateFrequencyCountService.new(people_array).execute
    gon.duplicated_people = CalculateDuplicatedPeopleService.new(people_array).execute
  end
end
