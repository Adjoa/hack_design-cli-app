module HackDesign
    class CLI
        def start
            puts "=== Hack Design CLI ==="
            main_menu
        end

        def main_menu
            puts "Enter a number to choose a lesson."
            puts "Enter 'q' to quit."
            list_lessons
            puts ""
            selection = gets.strip
            case(selection)
            # When selection.to_i is a number from 1 to 50
            # Accept a lesson number and display that lesson
            when 'q'
                puts "Same time tomorrow, okay? Goodbye!"
                exit
            else
                puts "You have not selected a valid option."
                puts ""
                main_menu
            end
        end

        def list_lessons
        end
    end
end
