module EventsHelper
  def format_address(street, city, state, zip_code)
    self.street + " " + self.city + " " + self.state + " " + self.zip_code
  end
end
