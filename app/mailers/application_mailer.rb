# frozen_string_literal: true

# アプリケーションメーラー
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
