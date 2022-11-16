# frozen_string_literal: true

# BEGIN
def anagramm?(word1, word2)
  word1.chars.tally == word2.chars.tally
end

def anagramm_filter(word, check_list)
  check_list.filter { |check_list_word| anagramm? word, check_list_word }
end
# END
