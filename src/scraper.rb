require "nokogiri"
require "httparty"
require "byebug"

def scraper
  url = "https://www.aldaba.com/ver_ofertas.php?pais=Rep%FAblica%20Dominicana&pais_id=&area=a:2:{i:0;s:31:%22Inform%E1tica,%20Sistemas,%20Internet%22;i:1;s:19:%22Ingenier%EDa%20Sistemas%22;}&area_id=&de_hoy=&q=&or=&ln=169&sel_ciudad="
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)

  job_titles = parsed_page.css("b")
  job_descriptions = parsed_page.css("td.italica.gright")
  job_posting_dates = parsed_page.css("font")

  job_titles.each do |job_title|
    if job_title.children.text == "1"
      next
    else
      job = {
        title: job_title.children.text,
        company: "test",
        description: job_title.css("td.italica.gright").children.text,
        date: "test",
        location: "test",
        url: "https://www.aldaba.com" + job_title,
      }
      byebug
    end
  end
end

scraper
