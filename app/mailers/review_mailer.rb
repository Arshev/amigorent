class ReviewMailer < ApplicationMailer
  default from: 'no-reply@amigorent.ru'

  def review_email
    @review = params[:review]
    mail(to: 'amigorent@ya.ru', subject: 'Новый отзыв')
  end

  def car_review_email
    @review = params[:review]
    mail(to: 'amigorent@ya.ru', subject: 'Новый отзыв на авто')
  end
end
