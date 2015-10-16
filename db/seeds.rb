# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# destroys existing ideas
Idea.destroy_all

# List of idea data
ideas = [
  { :desc => 'Airplanes'},
  { :desc => 'The wheel'},
  { :desc => 'Object-oriented programming'},
  { :desc => 'Basic Income'},
  { :desc => 'Feudalism'}
]

# loop that creates ideas in database
ideas.each do |idea_hash|
  idea = Idea.new
  idea.desc = idea_hash[:desc]
  idea.save
end

puts "There are #{Idea.count} ideas in the database"

