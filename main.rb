require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "./sinaqa.db"
)

class Question < ActiveRecord::Base
end

class Answer < ActiveRecord::Base
end

get '/admin' do
	erb :admin
end

post '/edit' do
	Question.create({:content => params[:question]})

	redirect '/admin'
end

get '/' do
	@questions = Question.order("id desc").all
	erb :index
end

get '/questions/([0-9]*)' do |i|
	@question_id = #{i}
	erb :question
end

get '/send/([0-9]*)' do |i|
	@question_id = #{i}

	#正解をチェック
	
	#正解ならOK、不正解ならNGメッセージを表示
	
	erb :question
end

