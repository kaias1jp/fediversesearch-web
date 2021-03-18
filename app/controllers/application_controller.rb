class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # ロケール振り分けを全てのアクションで実行
  around_action :switch_locale
before_action :detect_devise_variant
  # params値のロケールによる振り分け
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # url_for関係メソッドでロケールを設定するよう上書き
  def default_url_options
    { locale: I18n.locale }
  end
  def hello
    render html: "hello, world!"
  end
  private
    def detect_devise_variant
      ua = request.user_agent
      if(ua.include?('Mobile') || ua.include?('Android'))
        request.variant = :mobile
      end
    end
end
