class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    STDERR.puts request.env['rack.input'].read # => {"abc": "123"}
    STDERR.puts request.body # => #<File:0x00007f8460b2b088>
    STDERR.puts request.raw_post # =>
    STDERR.puts request.body.read # =>
  end
end
