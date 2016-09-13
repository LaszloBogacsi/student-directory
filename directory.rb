#Let's put all students into an array
students = [
    {name: "Dr. Hannibal Lechter", cohort: :november},
    {name: "Darth Vader", cohort: :november},
    {name: "Nurse Ratched", cohort: :november},
    {name: "Michael Corleone", cohort: :november},
    {name: "Alex DeLarge", cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november},
    {name: "The Terminator", cohort: :november},
    {name: "Freddy Krueger", cohort: :november},
    {name: "The Joker", cohort: :november},
    {name: "Joffrey Baratheon", cohort: :november},
    {name: "Norman Bates", cohort: :november},
  ]
  

def print_header
  puts "The Students of the Villains Academmy"
  puts "-----------"
end

def prints(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
#We print out the total number of students
print "Overall, we have #{students.count} great students"
end

#nothing happens until we call the methods
print_header
prints(students)
print_footer(students)