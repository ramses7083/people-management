require 'test_helper'

class CalculateDuplicatedPeopleServiceTest < ActiveSupport::TestCase
  test 'calculate frequency count' do
    @people = people.map { |p| Person.new.from_json(p.to_json) }
    response = CalculateDuplicatedPeopleService.new(@people).execute

    assert_equal duplicated_people, response
  end

  def duplicated_people
    [
      ['Email', 'Possibly duplicate'],
      ['sakatius@gmail.com', 'sakatiuss@gmail.com ']
    ]
  end
end
