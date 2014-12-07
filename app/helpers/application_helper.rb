#In addition to coming equipped with a large number of built-in functions 
#for use in the views, Rails also allows the creation of new ones.
#Such functions are called helpers; Each controller has a view associated to it
#and a helper file to call further functions

module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "My Sweet Spot"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

end
