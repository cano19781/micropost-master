class ArticlesController < ApplicationController
  before_filter :get_users
  #Filter User before enter
  before_filter :authenticate_user!
  # GET /articles
  # GET /articles.json
  def index
    @articles_count = Article.group(:user_id).count
    @articles = Article.all
    @articles = Article.search(params[:searchbox])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    
    end
  end


  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
   @article = current_user.articles.new(params[:article])
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Gracias por su aporte de conocimiento.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article = current_user.articles.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(article_params)
        format.html { redirect_to @article, notice: 'Su aporte ha sido editado satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  
  private
def get_users
  @users = User.all.map {|user| [user.name, user.id]}
end

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def article_params
      params.require(:article).permit(:text, :title, :user_id)
    end
end
