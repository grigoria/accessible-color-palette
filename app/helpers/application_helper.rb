SIZES = ["normal", "large"].sort

RATIOS = {
  "AA"  => { "normal" => 4.5, "large" => 3.0, SIZES => 3.0 },
  "AAA" => { "normal" => 7.0, "large" => 4.5, SIZES => 4.5 }
}

MATCHES = {
  "Don't check" => 0,
  "At least 1"  => 1,
  "At least 2"  => 2,
  "At least 3"  => 3,
  "All"         => 4,
}


module ApplicationHelper
  # @param palette [Hash]
  # @param bg_color [String]
  # @param score [Float] the required ratio score
  # @param matches [Integer] how many colors should match the rules
  def passes?(palette, bg_color, score, matches)
    current_matches = 0

    palette["colors"].reject { |c| c == bg_color[1..-1].upcase }.each do |c|
      color_score = ratio(bg_color, c)
      current_matches += 1 if color_score >= score
      return true if current_matches >= matches
    end

    false
  end

  # @param a [String] first color
  # @param b [String] second color
  #
  # @return [Float]
  def ratio(a, b)
    WCAGColorContrast.ratio(a.sub("#",""), b).round(2)
  end
end
