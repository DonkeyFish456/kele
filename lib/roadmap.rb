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

  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
    body = {
      checkpoint_id: checkpoint_id,
      assignment_branch: assignment_branch,
      assignment_commit_link: assignment_commit_link,
      comment: comment,
      enrollment_id: get_me['current_enrollment']['id']
    }
    response = self.class.post('/checkpoint_submissions', headers: {"authorization" => @auth_token}, body: body)
    parsed_response = JSON.parse(response.body)
  end
end