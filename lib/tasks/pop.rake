namespace :pop do
  desc "populate the planet with descriptions, characters and vehicles"
  task planet: :environment do
    5.times do
      planet = Planet.create(name: Faker::StarWars.planet, description: Faker::StarWars.wookie_sentence)
        3.times { Character.create(name: Faker::StarWars.character, vehicle: Faker::StarWars.vehicle, planet_id: planet.id)}
    end
  end
end
