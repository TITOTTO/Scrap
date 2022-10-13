require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "https://www.nosdeputes.fr/deputes"
page = Nokogiri::HTML(open(PAGE_URL))

tab = []
tab2 = []

puts page.xpath("/html/body/div[1]/div[5]/div/div[2]/div[2]/table/tbody/tr/td[X]/a[1]/div/span[2]")
/html/body/div[1]/div[5]/div/div[2]/div[74]/table/tbody/tr/td[3]

for x in 1..74
    for y in 1..3
        for v in 1..("/html/body/div[1]/div[5]/div/div[2]/div[#{x}]/table/tbody/tr".size)
    tab = page.xpath("/html/body/div[1]/div[5]/div/div[2]/div[#{x}]/table/tbody/tr/td[X]/a[1]/div/span[2]").text
end
/html/body/div[1]/div[5]/div/div[2]/div[47]/table/tbody/tr/td[3]/a[15]/div/span[2]
/html/body/div[1]/div[5]/div/div[2]/div[47]/table/tbody/tr/td[3]/a[1]
/html/body/div[1]/div[5]/div/div[2]/div[56]/table/tbody/tr/td[3]