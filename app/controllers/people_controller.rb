# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    token = ENV['SALESLOFT_TOKEN']
    url = 'https://api.salesloft.com/v2/people.json'
    response = HTTParty.get(url, headers: { 'Authorization' => "Bearer #{token}" })
    response_json = JSON.parse(response.body)
    people_data = response_json['data']
    people_array = people_data.map { |a| Person.new.from_json(a.to_json) }
    gon.people_list = FormatPeopleListService.new(people_array).execute
    gon.frecuency_count = CalculateFrequencyCount.new(people_array).execute
    gon.duplicated_people = CalculateDuplicatedPeople.new(people_array).execute
  end
end
