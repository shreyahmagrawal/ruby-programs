new_array = ['cake', 'party', 'choclates', 'gift']
new_hash = {cake: 'Ms Bakers', party: 'nibs', choclates: 'temptations', gift: 'presto'}

new_array.each do |word|
  puts word
end

new_hash.each do |c_word, word|
  puts "#{c_word}: #{word}"
end