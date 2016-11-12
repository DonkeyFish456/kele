require 'httparty'
require 'roadmap'
class Kele
  include HTTParty
  include Roadmap
  require 'json'
  base_uri 'https://www.bloc.io/api/v1'
  def initialize(email, password)
    options = {
        body: {
            email: email,
            password: password
        }
    }
    response = self.class.post('/sessions', options)

    if response['auth_token']
      @auth_token = response['auth_token']
    else
      'Please enter valid credentials.'
    end
  end

  def get_me
    headers = {
        headers: {
        'authorization' => @auth_token,
        'content_type' => 'application/json'
        }
    }
    response = self.class.get('/users/me', headers)
    parsed_response = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    headers = {
        headers: {
            'authorization' => @auth_token,
            'content_type' => 'application/json'
        }
    }
    response = self.class.get("/mentors/#{mentor_id}/student_availability", headers)
    parsed_response = JSON.parse(response.body)
  end
end
