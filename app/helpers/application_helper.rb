module ApplicationHelper
  def ratio(hex, color)
    number_with_precision(WCAGColorContrast.ratio(hex.sub("#",""), color), precision: 2)
  end
end
