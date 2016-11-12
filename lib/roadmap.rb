module Roadmap
  def get_checkpoint(checkpoint_id)
    headers = {
        headers: {
            'authorization' => @auth_token,
            'content_type' => 'application/json'
        }
    }
    response = self.class.get("/checkpoints/#{checkpoint_id}", headers)
    parsed_response = JSON.parse(response.body)
  end

  def get_roadmap(roadmap_id)
    headers = {
        headers: {
            'authorization' => @auth_token,
            'content_type' => 'application/json'
        }
    }
    response = self.class.get("/roadmaps/#{roadmap_id}", headers)
    parsed_response = JSON.parse(response.body)
  end
end