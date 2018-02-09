# Specifications for the CLI Assessment

Specs:

- [x] Have a CLI for interfacing with the application

  The CLI for this application is handled by the HackDesign::CLI class.
It is triggered in the hack-design executable file with its #start method.


- [x] Pull data from an external source

  The Scraper class pulls data from site files stored in the fixtures folder.
Those files were sourced from [hackdesign.org/lessons](hackdesign.org/lessons)
and each lesson's content page.


- [x] Implement both list and detail views

  The user is first greeted by a numbered list of lessons available
through the application. Selecting a lesson number takes the user
to the content of that lesson.
