#Let's put all students into an array
@first_letter = 'D' # we only take names starting with this letter
@students = []
@filname = ""

def input_students
  puts "option 1 selected."
  puts "please enter the name of the students"
  puts "To finish, just hit enter twice."
  #get the first name
  name = STDIN.gets.delete "\n"
  if name != ""
  puts "Please enter the cohort month"
  cohort = STDIN.gets.delete "\n"
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
      hashto_students(name, cohort)
    if cohort.empty?
      @students[@students.count - 1][:cohort] = "December" # if the cohort is empty the default value will be december
    end
    if @students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end
    #get another name from the user
    puts "please enter the next student"
    name = STDIN.gets.chomp
    puts "plese specify the students' cohort"
    cohort = STDIN.gets.chomp
  end
  else
    puts "No user input"
    exit
  end
end

def print_header
  puts "The Students of the Villains Academmy"
  puts "-----------"
end

def filtered_cohort(students_list)
 puts "Type the cohort filter"
 cohort_filter = gets.chomp.downcase
  @students.map do |cohort| 
    if cohort[:cohort] == cohort_filter.to_sym
        puts "Name: #{cohort[:name]} Cohort: #{cohort[:cohort]}"
    end
  end
end

def print_student_list
  
  list_length = @students.count #length of the student list
  i = 0 # loop counter
  while i < list_length #loop while the counter is less than the length of the list
    if @students[i][:name].length <= 12
     if @students[i][:name].upcase.index(@first_letter) == 0 # print only the names starting with a specific letter
        indexplusone = i + 1 # so the list starts from 1 not from 0.
        puts "#{indexplusone}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(60)
     end
    end
    i = i+ 1 #increment the counter
  end
end

def print_footer
  #We print out the total number of students
  if @students.count == 1
    print "Overall, we have 1 student"
    puts ""
  else
    print "Overall, we have #{@students.count} great students"
    puts""
  end
end

def interactive_menu
  loop do  
    print_menu
    process(STDIN.gets.chomp)
    end
end

def print_menu
   #print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def show_students
  puts "option 2 selected"
   #show the students
        print_header
        print_student_list
        print_footer
end

def process(selection)
  case selection
      when "1"
        #input the students
        input_students
      when "2"
        show_students
      when "3"
        filename_ask
        save_students
      when "4"
        filename_ask
        load_students(@filename)
      when "9"
        exit #this will cause the program to terminate  
      else
        puts "I don't know what you ment, try again"
      end
    end

def save_students
  puts "option 3 selected"
  puts "saving the students list"
  #open the file for writing
  puts @filename
  File.open(@filename, "w") {|file|
  #iterate over the array of students
  @students.each do |student|
  student_data = [student[:name], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
  end}
  puts "students saved to #{@filename}"
end

def load_students(filename)
  puts "option 4 selected"
  puts "loading students from file..."
  File.open(@filename, "r"){|file|
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
  hashto_students(name, cohort)
  end}
  puts "loading #{@filename} complete."
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  if filename.nil?
   puts "no filename specified, loading default list."
   load_students(@filename = "students.csv")
    return
  end
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{filename.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exits."
    exit # if filename doesn't exists quit the program
  end
end

def hashto_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}

end

def filename_ask
puts "Please define a filename with .csv extention."
input = gets.chomp
@filename = input
end

try_load_students
interactive_menu