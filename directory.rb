#Let's put all students into an array
students = [
    "Dr. Hannibal Lechter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "The Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
    ]
#and then we print them    
puts "The Students of the Villains Academmy"
puts "-----------"
students.each do |student|
    puts student
end
#We print out the total number of students
print "Overall, we have #{student.count} great students"