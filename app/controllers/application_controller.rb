class ApplicationController < ActionController::Base
  include SessionsHelper #include the SessionsHelper module into the Application controller
  def hello
    render html: "hello, world!"
  end
end
