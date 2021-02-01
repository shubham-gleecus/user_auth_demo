module ApplicationHelper
  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end

  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def time_stamp_at(date_or_time, format = :since)
    return '--' if date_or_time.nil?
    l Time.zone.parse(date_or_time.to_s), format: format # Jul 18 2018, 7:49 PM
  end
end
