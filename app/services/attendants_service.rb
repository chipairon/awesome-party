class AttendantsService
  require 'rest-client'
  require 'json'

  def self.get_for_user(user)
    [
     { username: "rohman", full_name: "Rommie Jefferson", email: "rommie@mart.com" },
     { username: "martha", full_name: "Martha Sullivan", email: "marss@mart.com" },
     { username: "john23", full_name: "Johnathan Aston", email: "johast@mart.com" },
     { username: "larryfl", full_name: "Larry Flynt", email: "flynting@mart.com" },
     { username: "bobby", full_name: "Robert Martin", email: "robert@mart.com" }
    ]
  end

  def self.get_for_event(permalink, current_user)
    attendants = RestClient.post("#{ENV["ATTENDANTS_URL"]}/by_event/#{permalink}", {user_email: current_user.email, user_token: current_user.doorkeeper_access_token}, content_type: :json, :accept => :json)
    attendants = JSON.parse(attendants)
  end
end
