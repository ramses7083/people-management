# frozen_string_literal: true

class String
  def username_from_email
    split(/(?=\b@\b|\+|&)/).first
  end
end
