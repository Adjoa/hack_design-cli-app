module HackDesign
    class CLI
        def start
            puts "=== Hack Design CLI ==="
            main_menu
        end

        def main_menu
            puts "Enter a number to select an option"
            puts " 1- List categories" 
            puts " 2- List all lessons" 
            puts " 3- Display a random lesson"
            puts "Enter 'q' to quit"
            puts ""
            selection = gets.strip
            case(selection)
            when '1'
                puts "Categories"
                puts "----------"
                puts ""
                main_menu
            when '2'
                puts "Lessons"
                puts "----------"
                puts ""
                main_menu
            when '3'
                puts "Random Lesson"
                puts "----------"
                puts ""
                main_menu
            when 'q'
                puts "Same time tomorrow, okay? Goodbye!"
                exit
            else
                puts "You have not selected a valid option."
                puts ""
                main_menu
            end
        end
    end
end