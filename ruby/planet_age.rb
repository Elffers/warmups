Earth: orbital period 365.25 Earth days, or 31557600 seconds
Mercury: orbital period 0.2408467 Earth years
Venus: orbital period 0.61519726 Earth years
Mars: orbital period 1.8808158 Earth years
Jupiter: orbital period 11.862615 Earth years
Saturn: orbital period 29.447498 Earth years
Uranus: orbital period 84.016846 Earth years
Neptune: orbital period 164.79132 Earth years

def age(seconds, planet)
  planet = planet.downcase
  earth_years = seconds.to_f/31557600
  mercury = earth_years / 0.2408467
  venus = earth_years / 0.61519726
  mars = earth_years / 1.8808158
  jupiter = earth_years / 11.862615 
  saturn = earth_years / 29.447498
  uranus = earth_years / 84.016846
  neptune = earth_years / 164.79132
   case 
   when planet == "earth"; age = earth_years
   when planet == "mercury"; age = mercury
   when planet == "venus" ; age = venus
   when planet == "mars"; age = mars
   when planet == "jupiter"; age = jupiter
   when planet == "saturn"; age = saturn
   when planet == "uranus"; age = uranus
   when planet == "neptune"; age = neptune
   else puts "nope!"
   end
  # if planet == "earth"
  #   age = earth_years
  # elsif planet == "mercury"
  #   age = mercury
  # elsif planet == "venus"
  #   age = venus
  # elsif planet == "mars"
  #   age = mars
  # elsif planet == "jupiter"
  #   age = jupiter
  # elsif planet == "saturn"
  #   age = saturn
  # elsif planet == "uranus"
  #   age = uranus
  # elsif planet == "neptune"
  #   age = neptune
  # else
  #   puts "That is not a planet!"     
  # end
  # age
end

age(1000000000, "earth")
age(1000000000, "mercury")

class SpaceAge
  attr_accessor :seconds

  def initialize(seconds)
    @seconds = seconds.to_i
  end

#seconds per planet_year
@orbital_period = {
  :earth => 31557600,
  :mercury => 7600543.81992,
  :venus => 19414149.052176,
  :mars => 59354032.690079994,
  :jupiter => 1873070822020468.5,
  :saturn => 929292362.8848,
  :uranus =>2651370019.3296,
  :neptune =>  5200418560.032001 
}

  def age
    age_array = []
    @orbital_period.each_pair do |planet, period|
      age = @seconds/period
      age_array << [planet, age]
    end
    age_array
  end

end



