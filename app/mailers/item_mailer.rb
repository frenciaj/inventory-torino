class ItemMailer < ApplicationMailer

  def reporte_diario_email(user)
    @user = user
    @stocks = Stock.where("created_at >= ?", Date.today)
mail(to: @user.email, cc: "herrajestorino@hotmail.com", subject: "Reporte de Stock del dia")
  end
end
