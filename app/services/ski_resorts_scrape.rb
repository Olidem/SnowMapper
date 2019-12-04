require 'open-uri'
require 'nokogiri'

class SkiResortScrape
  def initialize(url)
    @url = url
  end

  def scrape_data
    ski_resort_html = Nokogiri::HTML(open(@url + "ski-resort.html").read)
    begin
      description = ski_resort_html.search("#profileIN").inner_text.split("\r\n").slice(0,3).join(".")
    rescue NoMethodError
      puts "Scrape error"
    end
    begin
      address = ski_resort_html.search('.resortInfo')[1].inner_text
    rescue NoMethodError
      puts "Scrape error"
    end

    name = get_name_from_url(@url)

    return {
      name: name,
      address: address,
      description: description
    }
  end

  private

  def get_name_from_url(url)
    return url.split("/")[4].split("-").each { |word| word.capitalize! }.join(" ")
  end
end

# france_test = SkiResortScrape.new("https://www.onthesnow.co.uk/southern-alps/vars/")
# italy_test = SkiResortScrape.new("https://www.onthesnow.co.uk/trentino/folgarida-marilleva/")
# austria_test = SkiResortScrape.new("https://www.onthesnow.co.uk/tyrol/ischgl/")
# switzerland_test = SkiResortScrape.new("https://www.onthesnow.co.uk/graubunden/arosa/")
# new_zealand_test = SkiResortScrape.new("https://www.onthesnow.co.uk/new-zealand/rainbow-ski-area/")

# p france_test.scrape_data
# p italy_test.scrape_data
# p austria_test.scrape_data
# p switzerland_test.scrape_data
# p new_zealand_test.scrape_data
