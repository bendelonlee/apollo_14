describe 'user sees all astronauts' do
  describe 'user visits astronaut index page' do
    before(:each) do
      @astronaut_1 = Astronaut.create(name: "Joe", age: 40, job: "Specialist")
      @astronaut_2 = Astronaut.create(name: "Lisa", age: 41, job: "Chief")
      @astronaut_3 = Astronaut.create(name: "Alex", age: 21, job: "Makes coffee")

    end
    it 'displays a list of all astronauts' do
      visit '/astronauts'
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
  end

end
