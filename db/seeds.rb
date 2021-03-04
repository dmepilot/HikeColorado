# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
    :user_keys =>
      ["name", "username", "password", "admin", "email"],
    :users => [
      ["Testy McTesterton", "testy", "pw", true, "testy@test.com"],
      ["Demo McDemoface", "demo", "pw", false, "demo@test.com"],
      ["Fake Namedude", "fakey", "pw", false, "fakey@test.com"]
    ],
    :trail_keys =>
     ["name", "length", "difficulty", "dogs", "notes"],
    :trails => [
      ["Garden of the Gods Inner Loop", "1.3 mile loop", "easy", "yes, on leash", "see the red rocks"],
      ["Devil's Head Lookout", "2.7 mile out and back", "easy", "yes, on leash", "historic fire tower"],
      ["Emerald Lake", "3.3 mile out and back", "easy/moderate", "no", "in Rocky Mountain National Park"],
      ["Quandary Peak", "6.4 mile out and back", "moderate/difficult", "yes, on leash", "summit a 14,000' peak"],
      ["Four Pass Loop", "27.1 mile loop", "difficult", "yes, on leash", "plan on 3 to 4 days"]
    ],
    :hike_keys =>
     ["date", "rating", "comments", "user_id", "trail_id"],
    :hikes => [
        [DateTime.new(2020, 8, 15), 4, "test comments", 1, 3],
        [DateTime.new(2021, 1, 21), 3, "too cold", 2, 1],
        [DateTime.new(2020, 6, 8), 5, "great views!", 3, 5],
        [DateTime.new(2020, 9, 28), 5, "great fall colors!", 1, 2],
        [DateTime.new(2018, 7, 18), 4, "test comments", 1, 3],
        [DateTime.new(2018, 6, 13), 3, "test comments", 2, 4],
        [DateTime.new(2018, 8, 21), 5, "test comments", 3, 5],
        [DateTime.new(2018, 7, 4), 5, "test comments", 1, 1],
        [DateTime.new(2019, 6, 1), 5, "test comments", 2, 2],
        [DateTime.new(2019, 7, 19), 4, "test comments", 3, 3],
        [DateTime.new(2019, 9, 21), 4, "test comments", 1, 4],
        [DateTime.new(2019, 8, 22), 3, "test comments", 2, 5],
        [DateTime.new(2020, 5, 1), 2, "test comments", 3, 1],
        [DateTime.new(2020, 6, 9), 5, "test comments", 1, 2],
        [DateTime.new(2020, 7, 30), 4, "test comments", 2, 3],
        [DateTime.new(2020, 8, 2), 3, "test comments", 3, 4],
        [DateTime.new(2020, 5, 15), 4, "test comments", 1, 5],

    ]
  }
  
  def main
    make_users
    make_trails
    make_hikes
  end
  
  def make_users
    DATA[:users].each do |user|
      new_user = User.new
      user.each_with_index do |attribute, i|
        new_user.send(DATA[:user_keys][i]+"=", attribute)
      end
      new_user.save
    end
  end

  
  def make_trails
    DATA[:trails].each do |t|
      new_trail = Trail.new
      t.each_with_index do |attribute, i|
        new_trail.send(DATA[:trail_keys][i] + "=", attribute)
      end
      new_trail.save
    end
  end

  def make_hikes
    DATA[:hikes].each do |h|
        new_hike = Hike.new
        h.each_with_index do |attribute, i|
            new_hike.send(DATA[:hike_keys][i] + "=", attribute)
            end
        new_hike.save
        end
    end
  
  main