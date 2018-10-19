
def read_file
    file = File.open('Alumnos.csv', 'r') { |f| f.readlines.map(&:chomp) }
    file.map { |line| line.delete(' ').split(',') }
end
def average_notes
    
    a = File.open('Average by Student.txt','wb')
    read_file.each do |table|
      cant = table.length
      name = table.first
      notas = table[1..cant]
      
   
      sum = 0
      notas.each do |num|
        sum += num.to_i/5
        
      end
      
      a.puts "#{name}, #{sum} "
      
      print "La nota total de #{name} es de: #{sum}"
      
      puts
    end
    a.close
    puts
    puts 'Created "Average by Student" file.'
    puts
    
end

def no_attendance
    puts "No attendance total: #{File.read("Alumnos.csv").count('A')}"
    
  end
   
def approved
    a = File.open('Average by Student.txt','wb')
    read_file.each do |table|
      cant = table.length
      name = table.first
      notas = table[1..cant]

      sum = 0
      notas.each do |num|
        sum += num.to_i/5    
      end
      puts
      puts "#{name} approved with: #{sum}" if sum == 5 || sum > 5
      puts "#{name} did not approve with: #{sum}" if sum < 5
      
      
    end
    a.close
end

def start_menu
user_input = ""
while user_input != 4
    puts '1. Generate Average Marks'
    puts '2. Show No Attendance'
    puts '3. Show Only Approved'
    puts '4. Exit'
puts #nothing
    puts 'Select Option :'
    user_input = gets.to_i

    if user_input == 1
        puts '----------------------'
        puts 'Generating Average Marks...'
        average_notes
        
    elsif user_input == 2
        puts '----------------------'
        puts 'Show No Attendance'
        no_attendance

        elsif user_input == 3
            puts '----------------------'
            puts 'Show only Approved'
            approved
        elsif user_input == 4
            puts '----------------------'
            puts 'Exiting'
            
        elsif user_input > 4
            puts '----------------------'
            puts 'Invalid Option'
        end
puts '----------------------'
    end
end

start_menu