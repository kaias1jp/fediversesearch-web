# I18nライブラリに訳文の探索場所を指示する
# 外部Gemを利用する場合は、次の一文は削除する
I18n.load_path += Dir[Rails.root.join('lib/locale/*.{rb,yml}')]

# アプリケーションでの利用を許可するロケールをホワイトリスト化する
I18n.available_locales = [:en, :ja, :zh_Hant, :de]

# ロケールを:en以外に変更する
I18n.default_locale = :ja
