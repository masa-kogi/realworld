require 'rails_helper'

RSpec.describe "Api::Users", type: :request do
  describe "POST /api/users" do
   it "authenticates the user" do
     post "/api/users", params: { user: { username: "Jacob", email: "jake@jake.jake", password: "jakejake" } }
     token = JWT.encode({ user_id: User.last.id }, ApplicationController::SECRET_KEY)
     expect(response).to have_http_status(:created)
     expect(JSON.parse(response.body)).to eq("user" => {
                          "email" => "jake@jake.jake",
                          "token" => token,
                          "username" => "Jacob",
                          "bio" => nil,
                          "image" => nil
                        })
   end
   it "fails to authenticate" do
     post "/api/users", params: { user: { username: "", email: "jake@jake.jake", password: "jakejake" } }
     expect(response).to have_http_status(:unprocessable_entity)
     expect(JSON.parse(response.body)).to eq("errors" => {
                          "username" => ["can't be blank"]
                        })
   end
 end
end
