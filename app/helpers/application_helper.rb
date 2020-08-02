module ApplicationHelper
  def generate_link(name, link_path)
    if current_page?(link_path)
      link_to name, link_path, class: 'nav_btn_highlight'
    else
      link_to name, link_path
    end
  end
end
