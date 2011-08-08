require File.join(File.dirname(__FILE__), 'permalink_fu', 'railtie')
require File.join(File.dirname(__FILE__), 'permalink_fu', 'active_record')

begin
  require 'iconv'
rescue Object
  puts "No Iconv found, you might want to look into it."
end

module PermalinkFu

  class << self

    # This method does the actual permalink escaping.
    def escape(string)
      result = ::ActiveSupport::Inflector.transliterate(string.to_s)
      result = self.iconvify(result)
      result.gsub!(/[^\x00-\x7F]+/, '') # Remove anything non-ASCII entirely (e.g. diacritics).
      result.gsub!(/[^\w_ \-]+/i,   '') # Remove unwanted chars.
      result.gsub!(/[ \-]+/i,      '-') # No more than one of the separator in a row.
      result.gsub!(/^\-|\-$/i,      '') # Remove leading/trailing separator.
      result.downcase!
      result.size.zero? ? random_permalink : result
    rescue
      random_permalink
    end

    def random_permalink
      ::ActiveSupport::SecureRandom.hex(16)
    end

    def iconvify(string)
      return string unless defined?(Iconv)
      return Iconv.iconv('ascii//translit//IGNORE', 'utf-8', string).to_s
    end

  end

end