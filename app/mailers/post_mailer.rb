class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.commented.subject
  #
  def commented(post)
    @post = post
    @greeting = "Hi"

    mail to: 'barvis.fuchschittehr@gmail.com'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.deleted.subject
  #
  def deleted
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.updated.subject
  #
  def updated
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
