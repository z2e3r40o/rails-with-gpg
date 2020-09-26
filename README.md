# rails with gpg

> Inspired by a feature I use on [kraken.com](https://kraken.com).

Allow users to specify a PGP Public Key that will be used to encrypt emails sent to that user.

This repository contains a rails application that will gpg encrypt emails sent to users if they have a public key specified.

Key technologies used:
- rails 6
- [mail-gpg](https://github.com/jkraemer/mail-gpg)

Other notable technologies used:
- mailgun
- devise 4
- pg

The following describes the steps needed to get this repository running on heroku.

## Get Running

1.  `git clone git@github.com:z2e3r40o/rails-with-gpg.git`
2.  Create a free dyno at heroku.com. Enable hobby dev postgres add on. Enable starter mailgun add on
3.  Edit line 21 of `config/application.rb` so that `host = 'insert url to your heroku instance here'`.
4.  `heroku login`
5.  `git push heroku main:master`
6.  Register new user at https://your-app-name-here.herokuapp.com/users/sign_up using your actual email
7.  Set your public key at https://your-app-name-here.herokuapp.com/users/edit
8.  Add the email you registered with to the `Authorized Users` section of mailgun
9.  Navigate to https://your-app-name-here.herokuapp.com/example_email/index
10. Check inbox for encrypted email

## Interesting Pieces

1. [Gemfile](https://github.com/z2e3r40o/rails-with-gpg/blob/main/Gemfile#L57)
2. [app/mailers/user_mailer.rb](https://github.com/z2e3r40o/rails-with-gpg/blob/main/app/mailers/user_mailer.rb)
3. [add_public_key_to_users.rb](https://github.com/z2e3r40o/rails-with-gpg/blob/main/db/migrate/20200926021728_add_public_key_to_users.rb)
4. [app/views/devise/registrations/edit.html.erb](https://github.com/z2e3r40o/rails-with-gpg/blob/main/app/views/devise/registrations/edit.html.erb#L15-L18)
5. [application.rb](https://github.com/z2e3r40o/rails-with-gpg/blob/main/config/application.rb#L19-L28)
6. [example_email_controller](https://github.com/z2e3r40o/rails-with-gpg/blob/main/app/controllers/example_email_controller.rb)

## Troubleshooting

1. Not receiving email? Check `heroku logs`.
2. Something else? File an issue and I will try to answer.
