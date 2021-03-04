require "test_helper"

class PersonTest < ActiveSupport::TestCase
  setup do
    @person = Person.new.from_json(people.first.to_json)
  end

  test "init a person object" do
    assert_equal Person, @person.class
    assert_equal 'sakatius@gmail.com', @person.email_address
  end
end
