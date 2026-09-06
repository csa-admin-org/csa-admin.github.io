module NumberHelper
  def format_number(number)
    delimiter = I18n.locale == :en ? ',' : "'"
    number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1' + delimiter).reverse
  end

  def orgs_count
    data.organizations.size
  end
end
