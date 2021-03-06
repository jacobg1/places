# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Place.destroy_all
Post.destroy_all
Guess.destroy_all
User.destroy_all
Category.destroy_all
Tag.destroy_all

jake = User.create!(email: 'email@jake.com', password: 'password')

my_place = Place.create(country: 'USA', state: 'VA', city: 'Springfield', place_photo_url: 'http://a3.espncdn.com/combiner/i?img=%2Fi%2Fteamlogos%2Fncaa%2F500%2F258.png')
another_place = Place.create(country: 'USA', state: 'VA', city: 'Annandale', place_photo_url: 'http://a3.espncdn.com/combiner/i?img=%2Fi%2Fteamlogos%2Fncaa%2F500%2F258.png')

first_post = my_place.posts.create(title: 'CRAZY tree', photo_url: 'http://i.imgur.com/IMGCj.jpg')

first_guess = first_post.guesses.create(user: jake, guess_text: 'its a palm tree', score: 0)
second_guess = first_post.guesses.create(user: jake, guess_text: 'nah its a dogwood dude', score: 0)

first_cat = first_post.categories.create!(category_text: 'test')
second_cat = first_post.categories.create!(category_text: 'tree')




def us_states
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
end
