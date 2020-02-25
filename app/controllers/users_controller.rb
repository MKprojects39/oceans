class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit,
                                        :update, :destroy,
                                        :following, :followers]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  

  def index
    
    @users = User.page(params[:page]).search(params[:search])
    
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 5).search(params[:search])
    @likes = Like.where(article_id: params[:article_id])
    @users = User.where.not(id:current_user.id).sample(5)

  end
  

  def new
    if logged_in?
      redirect_to root_url
    else
    @user = User.new
    end
  end

  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ようこそ!"
      redirect_to @user
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])

  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Success
      flash[:success] = "編集しました"
      redirect_to @user
    else
 
      render 'edit'
    end
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to root_url
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render 'show_follow'
  end
  
  def followers
  @title = "Followers"
  @user = User.find(params[:id])
  @users = @user.followers.paginate(page: params[:page])
  render 'show_follow'
  end
  
  def main
    @day = Date.today.strftime('%Y年%m月%d日')
    @user = User.find(params[:id])

    @hoode_f_t_long = Article
            .where(article_tag:"[\"Hoode-F\"]", user_id:current_user.id)
            .or(Article.where(article_tag:"[\"T-long\"]", user_id:current_user.id))
            .sample(1)
    @jacket_m_jacket_s = Article
            .where(article_tag:"[\"Jaket-m\"]", user_id:current_user.id)
            .or(Article.where(article_tag:"[\"Jaket-s\"]", user_id:current_user.id))
            .sample(1)
    @jacket_m_jacket_s_hoode_j = Article
            .where(article_tag:"[\"Jaket-m\"]", user_id:current_user.id)
            .or(Article.where(article_tag:"[\"Jaket-s\"]", user_id:current_user.id))
            .or(Article.where(article_tag:"[\"Hoode-J\"]", user_id:current_user.id))
            .sample(1)
    @t_long_t_short = Article
            .where(article_tag:"[\"T-long\"]", user_id:current_user.id)
            .or(Article.where(article_tag:"[\"T-short\"]", user_id:current_user.id))
            .sample(1)
     @t_long_hoode_f = Article
            .where(article_tag:"[\"T-long\"]", user_id:current_user.id)
            .or(Article.where(article_tag:"[\"Hoode-F\"]", user_id:current_user.id))
            .sample(1)
    @auter = Article.where(article_tag:"[\"Auter\"]", user_id:current_user.id).sample(1)
    @auter_f = Article.where(article_tag:"[\"Auter-F\"]", user_id:current_user.id).sample(1)
    @jaket_s = Article.where(article_tag:"[\"Jaket-s\"]", user_id:current_user.id).sample(1)
    @jaket_m = Article.where(article_tag:"[\"Jaket-m\"]", user_id:current_user.id).sample(1)
    @hoode_j = Article.where(article_tag:"[\"Hoode-J\"]", user_id:current_user.id).sample(1)
    @hoode_f = Article.where(article_tag:"[\"Hoode-F\"]", user_id:current_user.id).sample(1)
    @t_long = Article.where(article_tag:"[\"T-long\"]", user_id:current_user.id).sample(1)
    @t_short = Article.where(article_tag:"[\"T-short\"]", user_id:current_user.id).sample(1)
    @pant = Article.where(article_tag:"[\"Pant\"]", user_id:current_user.id).sample(1)
    @shose = Article.where(article_tag:"[\"Shose\"]", user_id:current_user.id).sample(1)
   
    # 天気処理
    require 'open-uri'
    require 'kconv'
    require 'rexml/document'
    
     url  = "https://www.drk7.jp/weather/xml/13.xml"
     xml  = open( url ).read.toutf8
     doc = REXML::Document.new(xml)
     xpath = 'weatherforecast/pref/area[4]/'
     
     
     @weather = doc.elements[xpath + 'info[1]/weather'].text
     @maxtemp = doc.elements[xpath + 'info[1]/temperature/range[1]'].text
     @mintemp = doc.elements[xpath + 'info[1]/temperature/range[2]'].text
     @rain = doc.elements[xpath + 'info[1]/rainfallchance/period[3]'].text
     
    # Trello処理
    require 'trello'

    Trello.configure do |config|
    config.developer_public_key
    config.member_token 
    end
    
    member = Trello::Member.find('user17166436')
    boards = member.boards
    board = boards.find { |board| board.name == 'rails'}
    todaylist = board.lists[0]
    @todaycards = todaylist.cards
    weeklist = board.lists[3]
    @weekcards = weeklist.cards
   
  end
  
  
  private

    def user_params
      params.require(:user).permit(
        :name, :email, :password,
        :password_confirmation,:image)
    end



  
    def correct_user
     
 
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end