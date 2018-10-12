RSpec.describe Scraper do
  describe '.scrape_lessons_page' do
    it 'returns an array of objects containing lesson title and url pairs' do
      lessons_array = Scraper.scrape_lessons_page
      
      expect(lessons_array).to be_an(Array)
    end
  end
  
  # describe '.scrape_lesson' do
  # end
end