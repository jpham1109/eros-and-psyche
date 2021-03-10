require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class Zodiac < ApplicationRecord
    has_many :crushes
    has_many :users
   

    def user(dob, username)
        url = URI("https://astrology-horoscope.p.rapidapi.com/zodiac_astrology/result/")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(url)
        request["content-type"] = 'application/x-www-form-urlencoded'
        request["x-rapidapi-key"] = 'fd0c5f0f67msh9853b62adb960abp17734bjsn24d6a2dd4c01'
        request["x-rapidapi-host"] = 'astrology-horoscope.p.rapidapi.com'
        request.body = "mystic_dob=#{dob}&mystic_name=#{username}"

        response = http.request(request)
        parsed = JSON.parse(response.read_body)

    end 

    def compatibility(user_dob, crush_dob, user, crush)

        url = URI("https://astrology-horoscope.p.rapidapi.com/zodiac_compatibility/result/")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(url)
        request["content-type"] = 'application/x-www-form-urlencoded'
        request["x-rapidapi-key"] = 'fd0c5f0f67msh9853b62adb960abp17734bjsn24d6a2dd4c01'
        request["x-rapidapi-host"] = 'astrology-horoscope.p.rapidapi.com'
        request.body = "mystic_dob=#{user_dob}&mystic_dob2=#{crush_dob}&mystic_name=#{user}&mystic_name2=#{crush}"

        response = http.request(request)
        parsed = JSON.parse(response.read_body)
    end 
end
