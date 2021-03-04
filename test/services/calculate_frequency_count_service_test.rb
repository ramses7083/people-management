require 'test_helper'

class CalculateFrequencyCountServiceTest < ActiveSupport::TestCase
  test 'calculate frequency count' do
    @people = people.map { |p| Person.new.from_json(p.to_json) }
    response = CalculateFrequencyCountService.new(@people).execute

    assert_equal frequency_count, response
  end

  def frequency_count
    [
      ['Character', 'Count'],
      [:a, 7],
      [:m, 6],
      [:s, 6],
      [:i, 4],
      [:'@', 3],
      [:o, 3],
      [:c, 3],
      [:'.', 3],
      [:l, 3],
      [:t, 3],
      [:u, 2],
      [:g, 2],
      [:k, 2],
      [:e, 1]
    ]
  end
end
