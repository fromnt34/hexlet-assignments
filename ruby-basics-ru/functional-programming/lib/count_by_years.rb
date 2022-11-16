# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  users.filter { |user| user[:gender] == 'male' }
       .map { |user| user[:birthday].split('-').first }
       .tally
end
# END
