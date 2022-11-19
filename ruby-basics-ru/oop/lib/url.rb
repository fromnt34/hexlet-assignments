# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  attr :query_params

  extend Forwardable
  include Comparable

  def initialize(query)
    @query = query
    @uri = URI.parse(query)
    @query_params = query_parameters query
  end

  def_delegators :@uri, :to_s, :scheme, :host

  def query_param(key, default_value = nil)
    query_params.fetch key, default_value
  end

  private

  def <=>(other)
    return unless other.instance_of? Url

    @query <=> other.to_s
  end

  def query_parameters(query)
    return {} unless query.include? '?'

    address_parameters = query.split('?').last
    parameters = address_parameters.split '&'

    parameters.each_with_object({}) do |parameter, accumulator|
      key, value = parameter.split '='

      accumulator ||= 0
      accumulator[key.to_sym] = value
    end
  end
end
# END
