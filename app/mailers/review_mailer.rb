class ReviewMailer < ApplicationMailer
  default from: 'no-reply@amigorent.ru'

  def review_email
    @review = params[:review]
    mail(to: 'ashev08@gmail.com', subject: 'Новый отзыв')
  end

  def car_review_email
    @review = params[:review]
    mail(to: 'ashev08@gmail.com', subject: 'Новый отзыв на авто')
  end
end
