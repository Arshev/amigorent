class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :is_authorised, only: [:update, :destroy]
  before_action :set_text, only: [:index, :show]

  def index
    @articles = Article.paginate(page: params[:page])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_admin_path, notice: "Статья добавлена"
    else
      flash[:notice] = "Что то не так!"
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Сохранено"
    else
      flash[:notice] = "Что то не так!"
    end
    redirect_back(fallback_location: request.referer)
  end

  def show
  end

  def destroy
    if @article.destroy
      redirect_back(fallback_location: request.referer, notice: "Бронь удалена!")
    end
  end

  private
    def article_params
      params.require(:article).permit(:text, :title, :description, :text_en, :title_en, :description_en, :image)
    end

    def set_text
      @text = Text.first
      @cities = City.where(active: true)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "У вас нет прав на просмотр данной страницы!" unless current_user.is_admin
    end

end
