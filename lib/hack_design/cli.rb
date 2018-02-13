module HackDesign
    class CLI
        def start
            puts "Setting up...."
            build_lessons
            add_attributes_to_lessons
            puts "=== Welcome to the Hack Design CLI! ===".colorize(:light_blue)
            main_menu
        end

        def main_menu
            Lesson.list_lessons
            puts "Enter a number (0-50) to choose a lesson."
            puts "Enter 'q' to quit."
            puts ""
            selection = gets.strip

            case(selection)
            when '0'..'50'
              Lesson.display_lesson(selection.to_i)
              lesson_nav(selection.to_i)
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

        def lesson_nav(current_lesson)
          puts "[p]revious lesson \t [n]ext lesson \t [a]ll lessons \t [q]uit:__"

          nav_selection = gets.strip
          case(nav_selection)
          when 'p'
            l = prev_lesson(current_lesson)
            lesson_nav(l)
          when 'n'
            l = next_lesson(current_lesson)
            lesson_nav(l)
          when 'a'
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

        def prev_lesson(current_lesson)
          previous = current_lesson - 1
          previous < 0 ? previous = 50 : nil
          Lesson.display_lesson(previous)
          previous
        end

        def next_lesson(current_lesson)
          xnext = current_lesson + 1
          xnext > 50 ? xnext = 0 : nil
          Lesson.display_lesson(xnext)
          xnext
        end
    end
end
