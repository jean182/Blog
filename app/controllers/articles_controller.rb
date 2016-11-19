class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :set_article, except: [:index, :new, :create]
	#GET /articles
	def index
		#OTodos los registros
		@articles = Article.all
	end
	#GET /articles/:id
	def show
		#Buscar registros en este caso por su id
		@article.update_visits_count
		@comment = Comment.new
		
	end
	#GET /articles/new
	def new
		@article = Article.new
	end
	#
	def edit
		
	end
	#POST /articles
	def create
			
		@article = current_user.articles.new(article_params)

		if @article.save
			redirect_to @article
		else
			render :new				
		end
		
	end
	#DELETE /articles/:id
	def destroy	
		
		@article.destroy #Destroy elimina el objeto en la base de datos
		redirect_to articles_path
	end
	#PUT /articles/:id
	def update
		# @article.update_attributes({title: 'Nuevo título'})
		
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit	
		end
	end
	#Metodos privados
	private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :body)
	end
end