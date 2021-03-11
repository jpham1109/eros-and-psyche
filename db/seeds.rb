UserCrush.destroy_all
User.destroy_all
Crush.destroy_all
Zodiac.destroy_all
UserCrush.reset_pk_sequence
User.reset_pk_sequence
Crush.reset_pk_sequence
Zodiac.reset_pk_sequence
# require 'pry'
# require 'uri'
# require 'net/http'
# require 'openssl'
# require 'json'



users = [
  {username: "Sandra", password: "123abc", dob: "19951116" },
  {username: "Jamie", password: "123abc", dob: "19871109" },
  {username: "Bean", password: "123abc", dob: "20180115" },
  {username: "George", password: "123abc", dob: "20201206" }
]

users.each {|user| User.create(user)}



# url = URI("https://astrology-horoscope.p.rapidapi.com/zodiac_astrology/result/")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Post.new(url, 'result' => 'Your Zodiac Details')
# request["content-type"] = 'application/x-www-form-urlencoded'
# request["x-rapidapi-key"] = 'fd0c5f0f67msh9853b62adb960abp17734bjsn24d6a2dd4c01'
# request["x-rapidapi-host"] = 'astrology-horoscope.p.rapidapi.com'
# request.body = "mystic_dob=1987-05-21&mystic_name=John"

# response = http.request(request)
# parsed = JSON.parse(response.read_body)




20.times do 
    Crush.create({
      name: Faker::Name.name ,
      dob: Faker::Date.between(from: '1970-01-01', to: '2000-01-01')
    })
  end


crush_level = [rand(1..10)]

20.times do 
  UserCrush.create(crush_level: crush_level.sample, user: User.all.sample, crush: Crush.all.sample)
end

puts "💘✨ EROS & PSYCHE ✨💘"