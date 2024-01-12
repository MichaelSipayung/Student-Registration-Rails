class ApplicationController < ActionController::Base
  include SessionsHelper #include the SessionsHelper module into the Application controller
  def hello
    render html: "hello, world!"
  end
  private #derived class can access private method, see micropost controller
    def logged_in_user
      unless logged_in?
        store_location #store the location of the page that the user want to access
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end
end
