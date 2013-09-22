require "alchemy-api/version"
require 'httparty'

module AlchemyAPI
  class Client
    include HTTParty
    base_uri 'http://access.alchemyapi.com/calls'

    # Functions that can use Text, HTML, or URL
    COMMON_FUNCTIONS = [
      "GetRankedNamedEntities",
      "GetTextSentiment",
      "GetTargetedSentiment",
      "GetRankedKeywords",
      "GetRankedConcepts",
      "GetRelations",
      "GetCategory",
      "GetLanguage"
    ]

    WEB_ONLY_FUNCTIONS = [
      "GetAuthor",
      "GetFeedLinks",
      "GetText",
      "GetRawText",
      "GetTitle",
      "GetMicroformatData",
      "GetConstraintQuery"
    ]

    TEXT_FUNCTIONS = COMMON_FUNCTIONS.map { |func| "Text" + func }
    HTML_FUNCTIONS = (COMMON_FUNCTIONS+WEB_ONLY_FUNCTIONS).map { |func| "HTML" + func }
    URL_FUNCTIONS  = (COMMON_FUNCTIONS+WEB_ONLY_FUNCTIONS).map { |func| "URL" + func }

    def initialize(api_key)
      @default_options = { apikey: api_key, outputMode: 'json' }
    end

    TEXT_FUNCTIONS.each do |function_name|
      define_method(function_name) do |options|
        raise ArgumentError.new("Need to pass a hash") unless options.is_a?(Hash)
        raise ArgumentError.new("Need to pass text as an option") unless options.has_key?(:text)
        self.class.post("/text/#{function_name}", { body: @default_options.merge(options) })
      end
    end

    HTML_FUNCTIONS.each do |function_name|
      define_method(function_name) do |options|
        raise ArgumentError.new("Need to pass a hash") unless options.is_a?(Hash)
        raise ArgumentError.new("Need to pass html as an option") unless options.has_key?(:html)
        self.class.post("/html/#{function_name}", { body: @default_options.merge(options) })
      end
    end

    URL_FUNCTIONS.each do |function_name|
      define_method(function_name) do |options|
        raise ArgumentError.new("Need to pass a hash") unless options.is_a?(Hash)
        raise ArgumentError.new("Need to pass url as an option") unless options.has_key?(:url)
        self.class.post("/url/#{function_name}", { body: @default_options.merge(options) })
      end
    end
  end
end
