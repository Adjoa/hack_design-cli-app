module HackDesign
    class CLI
        def start
            puts "Setting up...."
            build_lessons
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
            when '0'..'50'
              display_lesson(selection.to_i)
            when 'q'
                puts "Same time tomorrow, okay? Goodbye!"
                exit
            else
                lesson_number = selection.to_i
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

        def display_lesson(lesson_number)
          lesson = Lesson.all[lesson_number]
          puts "#{lesson.title}"
          puts "#{lesson.instructor}"
          puts ""
          puts "#{lesson.introduction}"
          puts ""
          puts "Exercises for this lesson: "
          lesson.exercises.each do |exercise|
            puts"#{exercise[:title]}"
            puts "#{exercise[:description]}"
            puts "#{exercise[:url]}"
            puts ""
          end
        end
    end
end
