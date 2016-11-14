class ArticlesController < ApplicationController
	#GET /articles
	def index
		#OTodos los registros
		@articles = Article.all
	end
	#GET /articles/:id
	def show
		#Buscar registros en este caso por su id
		@article = Article.find(params[:id])
	end
	#GET /articles/new
	def new
		@article = Article.new
	end
	#
	def edit
		@article = Article.find(params[:id])
	end
	#POST /articles
	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render :new				
		end
		
	end
	#DELETE /articles/:id
	def destroy	
		@article = Article.find(params[:id])
		@article.destroy #Destroy elimina el objeto en la base de datos
		redirect_to articles_path
	end
	#PUT /articles/:id
	def update
		# @article.update_attributes({title: 'Nuevo título'})
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit	
		end
	end
	#Metodos privados
	private

	def article_params
		params.require(:article).permit(:title, :body)
	end
end