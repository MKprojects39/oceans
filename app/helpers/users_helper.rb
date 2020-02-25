module UsersHelper
    
  
  def auter
    @user = User.find(params[:id])
    @articles = @user.articles
    @tag_articles = @articles.where(article_tag:"[\"Auter\"]").paginate(page: params[:page], per_page: 4).search(params[:search])
    @users = User.where.not(id:current_user.id).sample(5)
  end
  
  def auter_f
    @user = User.find(params[:id])
    @articles = @user.articles
    @tag_articles = @articles.where(article_tag:"[\"Auter-F\"]").paginate(page: params[:page], per_page: 4).search(params[:search])
    @users = User.where.not(id:current_user.id).sample(5)
  end
  
  def jaket_m
    @user = User.find(params[:id])
    @articles = @user.articles
    @tag_articles = @articles.where(article_tag:"[\"Jaket-m\"]").paginate(page: params[:page], per_page: 4).search(params[:search])
    @users = User.where.not(id:current_user.id).sample(5)
  end
  
  def jaket_s 
    @user = User.find(params[:id])
    @articles = @user.articles
    @tag_articles = @articles.where(article_tag:"[\"Jaket-s\"]").paginate(page: params[:page], per_page: 4).search(params[:search])
    @users = User.where.not(id:current_user.id).sample(5)
  end
  
  def hoode_j
    @user = User.find(params[:id])
    @articles = @user.articles
    @tag_articles = @articles.where(article_tag:"[\"Hoode-J\"]").paginate(page: params[:page], per_page: 4).search(params[:search])
    @users = User.where.not(id:current_user.id).sample(5)
  end
  
  def hoode_f
    @user = User.find(params[:id])
    @articles = @user.articles
    @tag_articles = @articles.where(article_tag:"[\"Hoode-F\"]").paginate(page: params[:page], per_page: 4).search(params[:search])
    @users = User.where.not(id:current_user.id).sample(5)
  end
  
  def t_long
    @user = User.find(params[:id])
    @articles = @user.articles
    @tag_articles = @articles.where(article_tag:"[\"T-long\"]").paginate(page: params[:page], per_page: 4).search(params[:search])
    @users = User.where.not(id:current_user.id).sample(5)
  end
  
  def t_short
    @user = User.find(params[:id])
    @articles = @user.articles
    @tag_articles = @articles.where(article_tag:"[\"T-short\"]").paginate(page: params[:page], per_page: 4).search(params[:search])
    @users = User.where.not(id:current_user.id).sample(5)
  end
  
  def pant
    @user = User.find(params[:id])
    @articles = @user.articles
    @tag_articles = @articles.where(article_tag:"[\"Pant\"]").paginate(page: params[:page], per_page: 4).search(params[:search])
    @users = User.where.not(id:current_user.id).sample(5)
  end
  
  
  def shose
    @user = User.find(params[:id])
    @articles = @user.articles
    @tag_articles = @articles.where(article_tag:"[\"Shose\"]").paginate(page: params[:page], per_page: 4).search(params[:search])
    @users = User.where.not(id:current_user.id).sample(5)
  end
  
  def likes
    @user = User.find(params[:id])
    @articles = @user.articles
    @likes_article = Like.where(user_id: @user.id).paginate(page: params[:page], per_page: 5)
    @users = User.where.not(id:current_user.id).sample(5)
  end
end
