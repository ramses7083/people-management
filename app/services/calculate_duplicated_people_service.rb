# frozen_string_literal: true

class CalculateDuplicatedPeopleService
  attr_reader :people

  def initialize(people)
    @people = people
    @result = [['Email', 'Possibly duplicate']]
    @characteres = {}
    @max_typo_erros = 1
  end

  def execute
    duplicated_people_list
  end

  private

  def duplicated_people_list
    @people.each_with_index do |person, index|
      @duplicate_found = false
      @duplicate_emails = ''
      for index2 in index + 1..@people.count - 1
        compare_usernames(index2, person)
      end
      @result.push([person.email_address, @duplicate_emails]) if @duplicate_found
    end
    @result
  end

  def compare_usernames(index, person)
    username = person.email_address.username_from_email
    username_to_compare = @people[index].email_address.username_from_email
    if username.include?(username_to_compare) || username_to_compare.include?(username) ||
       usernames_are_similar(username, username_to_compare) || usernames_are_similar(username_to_compare, username)
      @duplicate_found = true
      @duplicate_emails += "#{@people[index].email_address} "
    end
  end

  def usernames_are_similar(username, username_to_compare)
    character_match_count = 0
    username.split('') do |c|
      if username_to_compare.include?(c)
        character_match_count += 1
        next
      end
    end

    return true if character_match_count == username.size &&
                   character_match_count + @max_typo_erros == username_to_compare.size

    false
  end
end
