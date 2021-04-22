require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
    url = "https://www.aldaba.com/detalle_of.php?oferta=24139873&f=1&job=Gerente-de-Tecnolog%EDa-Santo-Domingo"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    byebug
end

scraper