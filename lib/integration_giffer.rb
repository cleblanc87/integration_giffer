require "integration_giffer/version"
require 'fileutils'
require 'RMagick'

module IntegrationGiffer
  class Gif
    @@screenshots = {}
    def self.add png_name, png_data
      @@screenshots[png_name] ||= []
      @@screenshots[png_name] << 1
    end

    def self.get_new_index_for png_name
      return 0 if @@screenshots[png_name].nil?
      @@screenshots[png_name].length
    end
  end
end

module Selenium
  module WebDriver
    module DriverExtensions
      module TakesScreenshot
        def save_screenshot(png_name)
          FileUtils::mkdir_p './integration_giffer/output'
          png_data = screenshot_as(:png)
          index = IntegrationGiffer::Gif.get_new_index_for png_name
          png_name_numbered = "./integration_giffer/#{png_name}_#{index}.png"

          IntegrationGiffer::Gif.add png_name, png_data

          File.open(png_name_numbered, 'wb') { |f| f << png_data }
          `convert   -delay 20   -loop 0  ./integration_giffer/#{png_name}*.png  ./integration_giffer/output/#{png_name}.gif`
        end
      end
    end
  end
end
