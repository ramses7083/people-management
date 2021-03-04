# frozen_string_literal: true

class String
  def username_from_email
    return self.split(/(?=\b@\b|\+|&)/).first
  end
end
