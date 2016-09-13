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

def print_header
  puts "The Students of the Villains Academmy"
  puts "-----------"
end

def print(names)
  names.each do |student|
    puts student
  end
end

def print_footer(names)
#We print out the total number of students
print "Overall, we have #{student.count} great students"
end

#nothing happens until we call the methods
print_header
print(students)
print_footer(students)