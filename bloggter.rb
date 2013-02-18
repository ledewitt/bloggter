require          'bundler/setup'
require          'sinatra'
require_relative 'config/database'
require_relative 'lib/bloggter'
require          'json'

# for handle show ten most recent entries

get("/") {
  erb :home
}

post("/") {
  
}

get("/:handle") {
  user = Bloggter::User.find_by_handle!(params[:handle])
  entries = user.entries.limit(10).order("created_at DESC")
  if request.accept.include? "application/json"
    content_type :json
    entries.to_json(except:  [:id, :updated_at, :user_id],
                    include: {user: {except: [:id, :updated_at]}})
  else
    erb :entries, locals: { user:    user,
                            entries: entries }
  end
}

post('/:handle/bloggter') {
  user = Bloggter::User.find_by_handle!(params[:handle])
  user.entries.create!(body: params[:entry])
  redirect "/#{user.handle}"
}

error(ActiveRecord::RecordNotFound) {
  "User not found"
}
