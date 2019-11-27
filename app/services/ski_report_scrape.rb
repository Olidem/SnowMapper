require 'open-uri'

class SkiReportScrape
  def initialize(resort)
    @resort = resort
  end

  def scrape_data
    # base_url = @resort.on_the_snow_base_url
    base_url = "https://www.onthesnow.co.uk/northern-alps/val-disere/"
    ski_report_html = Nokogiri::HTML(open(base_url + "skireport.html").read)
    # ski_resort_html = Nokogiri::HTML(open(base_url + "ski-resort.html").read)
    begin
      status = ski_report_html.search('.current_status').inner_text
    rescue NoMethodError
      puts "Scrape error"
    end
    begin
      snowfall_today = ski_report_html.search('.today .station.top .predicted_snowfall .bluePill').inner_text
    rescue NoMethodError
      puts "Scrape error"
    end
    begin
      snowfall_tomorrow = ski_report_html.search('.bluePill')[9].inner_text
    rescue NoMethodError
      puts "Scrape error"
    end
    begin
      snow_condition = ski_report_html.search('div._report.snowReportInfo .clearfix .right').children[2].inner_text
    rescue NoMethodError
      puts "Scrape error"
    end
    begin
      open_runs = ski_report_html.search('.open.value').first.inner_text
    rescue NoMethodError
      puts "Scrape error"
    end
    begin
      open_piste = ski_report_html.search('.open.value')[1].inner_text
    rescue NoMethodError
      puts "Scrape error"
    end
    begin
      open_lifts = ski_report_html.search('.open.value')[2].inner_text
    rescue NoMethodError
      puts "Scrape error"
    end
    return {
      status: status,
      snowfall_today: snowfall_today,
      snowfall_tomorrow: snowfall_tomorrow,
      snow_condition: snow_condition,
      open_runs: open_runs,
      open_piste: open_piste,
      open_lifts: open_lifts
    }
  end
end
