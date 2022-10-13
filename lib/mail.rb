require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "Saisissez le numéro région"
reg = gets.chomp
puts "Saisissez le nom de votre département"
dep = gets.chomp
page = "http://annuaire-des-mairies.com/#{reg}/#{dep}.html"


def get_townhall_email(townhall_url)
    url = Nokogiri::HTML(open(townhall_url))
    return url.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
end

def get_townhall_urls
    tab = []
    tab2 = []
    url = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    for x in 0..61
        tab = tab << url.xpath("//a[@class = 'lientxt']")[x].text
    end
    for x in 0...tab.length
        tab[x] = tab[x].gsub(/ /, "-")
    end
    tab.each do |x|
        url = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{x.downcase}.html"))
        tab2 = tab2 << url.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    end
    return tab2
end

=begin

page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/doubs.html"))
puts page2.xpath("/html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/table[2]/tbody/tr[2]/td/table/tbody/tr/td").size
tab = page2.xpath("//a[@class = 'lientxt']")[1].text
for x in 0...tab.length
    tab[x] = tab[x].gsub(/ /, "-")
end
puts tab[0..20]

puts page2.xpath("//a[@class = 'lientxt'][true()]")
=end
puts get_townhall_email(page)
puts get_townhall_urls