require 'test_helper'

class FormatPeopleListServiceTest < ActiveSupport::TestCase
  test 'format people list' do
    @people = people.map { |p| Person.new.from_json(p.to_json) }
    response = FormatPeopleListService.new(@people).execute

    assert_equal formated_people_list, response
  end

  def formated_people_list
    [
      ['Name', 'Email', 'Job Title'],
      ['Steven Pease', 'sakatius@gmail.com', 'Software Engineer'],
      ['Possibly Duplicate', 'sakatiuss@gmail.com', 'My Job'],
      ['SomethingNewHere Here1', 'last@me.com', 'Baby Yoda Keeper']
    ]
  end
end
