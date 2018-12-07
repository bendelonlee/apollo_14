require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do
    it 'returns the average age' do
      @astronaut_1 = Astronaut.create(name: "Joe", age: 40, job: "Specialist")
      @astronaut_2 = Astronaut.create(name: "Lisa", age: 50, job: "Chief")
      @astronaut_3 = Astronaut.create(name: "Alex", age: 30, job: "Makes coffee")
      expect(Astronaut.average_age).to eq(40)
    end

  end
end
