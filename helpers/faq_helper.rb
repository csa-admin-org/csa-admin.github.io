module FaqHelper
  def faq_keys
    Array(I18n.t("faq.items"))
  end
end
