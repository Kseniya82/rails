module BadgesHelper
  Badge::RULES.map { |name| { I18n.t("helpers.badge.#{name}") => name } }
end
