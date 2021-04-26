require "nokogiri"
require "httparty"
require "byebug"

class Job
  String title = ""
  String description = ""
  String url = ""
  #DateTime posting_date = DateTime.new
  Number salary = 0
end

def scraper
  url = "https://www.aldaba.com/ver_ofertas.php?pais=Rep%FAblica%20Dominicana&pais_id=&area=a:2:{i:0;s:31:%22Inform%E1tica,%20Sistemas,%20Internet%22;i:1;s:19:%22Ingenier%EDa%20Sistemas%22;}&area_id=&de_hoy=&q=&or=&ln=169&sel_ciudad="
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)

  job_titles = parsed_page.css("b")
  job_descriptions = parsed_page.css("td.italica.gright")
  job_posting_dates = parsed_page.css("font")
  job_urls = parsed_page.css("a.ficha")

end

def method_name
  
end

job1 = Job.new
job2 = Job.new
job3 = Job.new
job4 = Job.new
job5 = Job.new
job6 = Job.new
job7 = Job.new
job8 = Job.new
job9 = Job.new
job10 = Job.new
scraper
