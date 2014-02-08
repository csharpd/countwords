#Read the text file into a string
#Split the text into an array of words
#Count the number of times each word occurs, storing it in a hash
#Display the word frequency list
def stop_words 
    # Words taken from Jonathan Feinberg's cue.language (via jasondavies.com), see lib/cue.language/license.txt.
    "i|me|my|myself|we|us|our|ours|ourselves|you|your|yours|yourself|yourselves|he|him|his|himself|she|her|hers|herself|it|its|itself|they|them|their|theirs|themselves|what|which|who|whom|whose|this|that|these|those|am|is|are|was|were|be|been|being|have|has|had|having|do|does|did|doing|will|would|should|can|could|ought|im|youre|hes|shes|its|were|theyre|ive|youve|weve|theyve|id|youd|hed|shed|wed|theyd|ill|youll|hell|shell|well|theyll|isnt|arent|wasnt|werent|hasnt|havent|hadnt|doesnt|dont|didnt|wont|wouldnt|shant|shouldnt|cant|cannot|couldnt|mustnt|lets|thats|whos|whats|heres|theres|whens|wheres|whys|hows|a|an|the|and|but|if|or|because|as|until|while|of|at|by|for|with|about|against|between|into|through|during|before|after|above|below|to|from|up|upon|down|in|out|on|off|over|under|again|further|then|once|here|there|when|where|why|how|all|any|both|each|few|more|most|other|some|such|no|nor|not|only|own|same|so|than|too|very|say|says|said|shall"
end

def remove_stop_words(hash)
    puts "Filtering out common words..."
    stop_words.split('|').each do |stop_word|
      hash.delete(stop_word)
    end
  return hash
end


puts 'What is the name and path of the file?'
filename = gets.chomp

text = String.new
File.open(filename) { |f|  text = f.read } 
text.downcase!
text = text.gsub(/[^a-z\s]/, '')

words = text.split

puts "the ORIGINAL word count is #{words.count} " 
#this could be better! 

freqs = Hash.new(0)

words.each { |word| freqs[word] += 1 }

puts freqs

puts "Now removing stop words..."
new_freqs = remove_stop_words(freqs)

new_freqs = new_freqs.sort_by {|x,y| y }

new_freqs.reverse!

new_freqs.each {|word, freq| puts word+' '+freq.to_s}

puts 'words that occur more than 7 times:'

new_freqs.each {|word, freq| puts word+' '+freq.to_s if freq>7}

puts "the word count is #{new_freqs.count} " 

new_freqs.each {|word, freq| puts word+' appears '+freq.to_s+' times :)' if freq==49}

puts "the number of words that begin with a in this file are #{text.count('a')}"

puts new_freqs.include?('beach')










# words.each do |word|
#         if WORDS_COUNT[word]
#       WORDS_COUNT[word] += 1
#     else
#       WORDS_COUNT[word] = 1
#     end
#   end
# end



#def popularwords
#freqs.each {|word, freq|} do
#if freq>15
#    puts word+' '+freq.to_s
#else
#    nil
#end




