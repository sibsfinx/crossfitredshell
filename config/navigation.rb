# configures your navigation
# https://github.com/codeplant/simple-navigation/wiki/Configuration

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    #primary.item :hotels, I18n.t("admin.menu.hotels"), root_url, if: proc { current_user.admin? }

    primary.dom_class = 'nav welcome-navbar__nav'

    primary.item :welcome, 'Главная', root_url

    primary.item :welcome, 'Направления и расписание', sections_path

    primary.item :wod, 'Тренировка дня / WOD', wod_posts_path

    # you can turn off auto highlighting for a specific level
    primary.auto_highlight = true
  end
end
