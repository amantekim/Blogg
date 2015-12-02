module ApplicationHelper
  def show_flash(name, message)
    if name  == "notice"
    content_tag :p, message, class: "correct-style"
    elsif name == "alert"
    content_tag :p, message, class: "wrong-style"
    end
  end
end
