module HackDesign
    class CLI
        def start
            puts "Setting up...."
            build_lessons
            puts "Just a second more..."
            add_attributes_to_lessons
            puts "=== Welcome to the Hack Design CLI! ==="
            main_menu
        end

        def main_menu
            list_lessons
            puts "Enter a number (0-50) to choose a lesson."
            puts "Enter 'q' to quit."
            puts ""
            selection = gets.strip
            case(selection)
            when selection.to_i.between(0, 50)
              lesson_number = selection.to_i
              display_lesson(lesson_number)
            when 'q'
                puts "Same time tomorrow, okay? Goodbye!"
                exit
            else
                puts "You have not selected a valid option."
                puts ""
                main_menu
            end
        end

        def build_lessons
          lessons_array = Scraper.scrape_lessons_page
          Lesson.create_from_collection(lessons_array)
        end

        def add_attributes_to_lessons
          Lesson.all.each do |lesson|
            lesson_attributes = Scraper.scrape_lesson(lesson.url)
            lesson.add_attributes(lesson_attributes)
          end
        end

        def list_lessons
          Lesson.all.each_with_index do |lesson, lesson_number|
           puts "#{lesson_number} #{lesson.title}"
          end
        end
    end
end
