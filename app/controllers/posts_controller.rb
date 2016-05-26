class PostsController < ApplicationController

  def index
    filtro=params[:search]
    if filtro.nil?
      @todosPost=Post.all
    else
      @todosPost=Post.where('lower(title) LIKE ?' ,"%#{params[:search].downcase}%")
      @todosPost=Post.where('lower(content) LIKE ?' ,"%#{params[:search].downcase}%")
    end
  end

  def new
    @editPost=Post.new
  end

  def show
    @mostrarPost=Post.find_by_id(params[:id])
  end

  def create
    nuevoPost= Post.new(params.require(:post).permit(:title,:content,:reviewDate))
    #Guarda en la BD
    nuevoPost.save
  	#render plain:nuevoPost.inspect
    redirect_to posts_path
  end

  def edit
    @editPost= Post.find_by_id(params[:id])
  end


  def update
    @editPost=Post.find_by_id(params[:id])
    @editPost.update(params.require(:post).permit(:title,:content))
    redirect_to posts_path
  end
end
