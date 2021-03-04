# frozen_string_literal: true

class CalculateFrequencyCount
  attr_reader :people

  def initialize(people)
    @people = people
    @headers = ['Character', 'Count']
    @characteres = {}
  end

  def execute
    frecuency_count_list
  end

  private

  def frecuency_count_list
    @people.map do |person|
      person.email_address.split('') do |c|
        if @characteres[c.to_sym].nil?
          @characteres[c.to_sym] = 1
        else
          @characteres[c.to_sym] += 1
        end
      end
    end
    data = @characteres.sort_by {|key, value| value}.reverse
    data.unshift(@headers)
    data
  end
end