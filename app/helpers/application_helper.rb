module ApplicationHelper
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def start_at_right_move(string)
    array = string.split
    start_keeping = false
    # binding.pry
    array.map do |element|
      if start_keeping
        element
      else
        next unless element =~ /\d+./
        start_keeping = true
        element
      end
    end.compact.join(" ")
  end
end
