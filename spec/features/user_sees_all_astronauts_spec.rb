describe 'user sees all astronauts' do
  describe 'user visits astronaut index page' do
    before(:each) do
      @astronaut_1 = Astronaut.create(name: "Joe", age: 40, job: "Specialist")
      @astronaut_2 = Astronaut.create(name: "Lisa", age: 50, job: "Chief")
      @astronaut_3 = Astronaut.create(name: "Alex", age: 30, job: "Makes coffee")

      @mission_1 = @astronaut_1.missions.create!(title: "Zeppo", time_in_space: 100)
      @mission_2 = @astronaut_1.missions.create!(title: "Apollo", time_in_space: 100)
      @mission_3 = @astronaut_1.missions.create!(title: "Delta", time_in_space: 100)
      visit '/astronauts'
    end
    it 'displays a list of all astronauts' do
      expect(page).to have_content(@astronaut_1.name)
      expect(page).to have_content(@astronaut_1.job)
      expect(page).to have_content(@astronaut_1.age)

      expect(page).to have_content(@astronaut_2.name)
      expect(page).to have_content(@astronaut_2.job)
      expect(page).to have_content(@astronaut_2.age)

      expect(page).to have_content(@astronaut_3.name)
      expect(page).to have_content(@astronaut_3.job)
      expect(page).to have_content(@astronaut_3.age)

    end
    it 'displays the average age of the astronauts' do
      expect(page).to have_content("Average age: 40")
    end
    it 'displays the astronauts missions by alphabetical order' do
      save_and_open_page
      expect(page).to have_content("#{@mission_2.title}, #{@mission_3.title}, #{@mission_1.title}")
    end
  end


end
