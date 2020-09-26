class UserMailer < ApplicationMailer
  def example_email(user)
    encryption = {
      encrypt: user.public_key.present?,
      keys: { user.email => user.public_key }
    }
    mail to: user.email, subject: 'example email', gpg: encryption
  end
end
