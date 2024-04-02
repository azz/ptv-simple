
class Requests::Base
  def initialize
    @client = RubyPtv::Client.new(RubyPtv.configuration)
  end

  protected

  attr_reader :client
end
