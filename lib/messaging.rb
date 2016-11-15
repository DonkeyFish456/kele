module Messaging
  def get_messages(*pages)
    headers = {
        values: {
            'page' => pages
        },
        headers: {
            'authorization' => @auth_token,
            'content_type' => 'application/json'
        }
    }
    response = self.class.get("/message_threads", headers)
    parsed_response = JSON.parse(response.body)
  end

  def create_message(subject, body, user_id, recipient_id)
    body = {
      user_id: user_id,
      recipient_id: recipient_id,
      subject: subject,
      'stripped-text' => body
    }
    response = self.class.post('/messages', headers: {"authorization" => @auth_token}, body: body)
    parsed_response = JSON.parse(response.body)
  end
end