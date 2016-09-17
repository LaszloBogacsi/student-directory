#Let's put all students into an array
@first_letter = 'D' # we only take names starting with this letter
students_list = [  #hardcoded list only to test the filtering method
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :january},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :december},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :january},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :december},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :january},  
  {name: "Norman Bates", cohort: :november}
]

def input_students
  puts "please enter the name of the students"
  puts "To finish, just hit enter twice."
  #create an empty array
  students = []
  #get the first name
  name = gets.delete "\n"
  if name != ""
  puts "Please enter the cohort month"
  cohort = gets.delete "\n"
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
      
      students << {name: name, cohort: cohort, hobbies: :fishing, height: :'6ft'}
    if cohort.empty?
      students[students.count - 1][:cohort] = "December" # if the cohort is empty the default value will be december
    end
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    #get another name from the user
    name = gets.chomp
    cohort = gets.chomp
  end
  else
    puts "No user input"
    exit
  end
      #return the array of students
  students
end

def print_header
  puts "The Students of the Villains Academmy"
  puts "-----------"
end

def filtered_cohort(students_list)
 puts "Type the cohort filter"
 cohort_filter = gets.chomp.downcase
  students.map do |cohort| 
    if cohort[:cohort] == cohort_filter.to_sym
        puts "Name: #{cohort[:name]} Cohort: #{cohort[:cohort]}"
    end
  end
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

def print_footer(students)
  #We print out the total number of students
  if students.count == 1
    print "Overall, we have 1 student"
    puts ""
  else
    print "Overall, we have #{students.count} great students"
    puts""
  end
end

def interactive_menu
  students = []
  loop do
    
    #print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    
    #read the input and save it into a variable
    selection = gets.chomp
    
    #do what the user asked
    case selection
      when "1"
        #input the students
        students = input_students
        
      when "2"
        #show the students
        print_header
        prints(students)
        print_footer(students)
      when "9"
        exit #this will cause the program to terminate  
      else
        puts "I don't know what you ment, try again"
      end
    end
    
end




#nothing happens until we call the methods

interactive_menu
#students = input_students #to test the filter I'm usig the hardcoded list of students instead of the user input method 

#print_header
#filtered_cohort(students) #print out the cohort filtered list
#prints(students) 
#print_footer(students)