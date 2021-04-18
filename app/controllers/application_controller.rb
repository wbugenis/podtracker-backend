class ApplicationController < ActionController::API

    def authenticate
        auth_header = request.headers["Authorization"]
        token = auth_header.split.last
        payload = JWT.decode(token, ENV["JWT_SECRET"], true, { algorithm: 'HS256' }).first
        @user = User.find_by(id: payload["user_id"])
      rescue
        render json: { errors: ["Unauthorized"] }, status: :unauthorized
    end
    
end
