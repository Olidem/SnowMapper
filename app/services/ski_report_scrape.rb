require 'open-uri'
require 'nokogiri'


class SkiReportScrape
  def initialize(url, resort)
    @url = url
    @resort = resort
  end

  def scrape_data
    ski_report_html = Nokogiri::HTML(open(@url + "skireport.html").read)
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
