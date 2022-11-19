# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  attr :address, :query_params

  include URI
  extend Forwardable
  include Comparable

  def initialize(address)
    @address = address
    @uri = URI(address)
    @query_params = query_parameters address
  end

  def_delegators :@uri, :scheme, :host

  def query_param(key, default_value = nil)
    query_params.fetch key, default_value
  end

  private

  def <=>(other)
    return unless other.instance_of? Url

    address <=> other.address
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
