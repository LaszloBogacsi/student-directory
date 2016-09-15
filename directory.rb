#Let's put all students into an array
@first_letter = 'D' # we only take names starting with this letter
def input_students
  puts "please enter the name of the students"
  puts "To finish, just hit enter twice."
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  puts "Please enter the cohort month"
  cohort = gets.chomp
  #default_cohort = "December".to_sym
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
      
      students << {name: name, cohort: cohort, hobbies: :fishing, height: :'6ft'}
    if cohort.empty?
      students[students.count - 1][:cohort] = "December" # if the cohort is empty the default value will be december
    end
    puts "Now we have #{students.count} students"
    
    #get another name from the user
    name = gets.chomp
    cohort = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The Students of the Villains Academmy"
  puts "-----------"
end

def prints(students)
  list_length = students.count #length of the student list
  i = 0 # loop counter
  while i < list_length #loop while the counter is less than the length of the list
    if students[i][:name].length <= 12
     if students[i][:name].upcase.index(@first_letter) == 0 # print only the names starting with a specific letter
        indexplusone = i + 1 # so the list starts from 1 not from 0.
        puts "#{indexplusone}. #{students[i][:name]} (#{students[i][:cohort]} cohort), hobby: #{students[i][:hobbies]}, height: #{students[i][:height]}".center(80)
     end
    end
    i = i+ 1 #increment the counter
  end
end
=begin
def prints(students)
  students.each_with_index do |student, index| #use each_with_index
    if student[:name].length <= 12
      if student[:name].index(@first_letter) == 0 # print only the names starting with a specific letter
        indexplusone = index + 1 # so the list starts from 1 not from 0.
        puts "#{indexplusone}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end
end
=end

def print_footer(students)
#We print out the total number of students
print "Overall, we have #{students.count} great students"
end

#nothing happens until we call the methods
students = input_students

print_header
prints(students)
print_footer(students)