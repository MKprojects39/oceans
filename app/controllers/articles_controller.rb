class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def time
    @user = User.find_by(id: params[:id])
    @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5).search(params[:search])
    @likes = Like.where(article_id: params[:article_id])
    @users = User.where.not(id:current_user.id).sample(5)
   
  end
  
  def show
    @article = Article.find_by(id: params[:id])
    @users = User.where.not(id:current_user.id).sample(5)
    @user = @article.user
    @likes = Like.where(article_id: params[:article_id])
    @comment = Comment.new(article_id: @article.id)
   
  end


  def edit
    @article = Article.find_by(id: params[:id])
  end
  
  def update
    @article = Article.find_by(id: params[:id])
    if @article.update_attributes(article_params)
      # Success
      flash[:success] = "編集しました"
      redirect_to current_user
    else

      render 'edit'
    end
  end
  
  def new
      @article = Article.new
  end
  
  
  def create
      @article = current_user.articles.build(article_params)
      if @article.save
        flash[:success] = "投稿完了！"
        redirect_to current_user
      else
        redirect_to  new_article_path
      end
  end
  def destroy
    @article.destroy
    flash[:success] = "投稿削除しました。"
    redirect_to request.referrer || root_url
  end



  
   private
   
   def article_params
     params.require(:article).permit(:content, :picture, article_tag:[])
   end
   
    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to root_url if @article.nil?
    end
end
