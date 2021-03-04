# frozen_string_literal: true

class FormatPeopleListService
  attr_reader :people

  def initialize(people)
    @people = people
    @result = [['Name', 'Email', 'Job Title']]
  end

  def execute
    format_people_list
  end

  private

  def format_people_list
    @people.map do |person|
      @result.push(["#{person.first_name} #{person.last_name}", person.email_address, person.title])
    end
    @result
  end
end
