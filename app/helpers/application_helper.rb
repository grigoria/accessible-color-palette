module ApplicationHelper
  # @param a [String] first color
  # @param b [String] second color
  #
  # @return [Float]
  def ratio(a, b)
    WCAGColorContrast.ratio(a.sub("#",""), b).round(2)
  end

  # @return [Boolean]
  def passes?(palette, bg_color, score, matches)
    current_matches = 0

    palette["colors"].reject { |c| c == bg_color[1..-1].upcase }.each do |color|
      color_score = ratio(bg_color, color)
      current_matches += 1 if color_score >= score
      return true if current_matches >= matches
    end

    false
  end
end
