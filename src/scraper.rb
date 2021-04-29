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
  job_urls = parsed_page.css("a.ficha")

  job_titles_arr = Array.new
  job_descriptions_arr = Array.new
  job_urls_arr = Array.new

  job_titles.each do |title|
    job_titles_arr.push(title.children)
  end

  #Need to delete the first element as the css element we used returns a "1" as the first element.
  job_titles_arr.shift

  #Aldaba.com would sometimes serve ads in the middle of the jobs listings and it gets added as a job using the css element for job titles.
  #here I'm just confirming if an ad was served so I can then remove it from the array.
  if (job_titles_arr.count - job_descriptions.count) == 1
    job_titles_arr.delete(5)
  end

  job_descriptions.each do |description|
    job_descriptions_arr.push(description.children)
  end

  job_urls.each do |url|
    job_urls_arr.push(url.attribute("href").value)
  end
end

scraper
