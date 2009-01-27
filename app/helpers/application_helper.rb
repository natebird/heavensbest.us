module ApplicationHelper
  
  # Sets the page title and outputs title if container is passed in.
  # eg. <%= title('Hello World', :h2) %> will return the following:
  # <h2>Hello World</h2> as well as setting the page title.
  def title(str, container = nil)
    @page_title = str
    content_tag(container, str) if container
  end
  
  # Outputs the corresponding flash message if any are set
  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << content_tag(:div, html_escape(flash[msg.to_sym]), :id => "flash-#{msg}") unless flash[msg.to_sym].blank?
    end
    messages
  end

  # Sets a link with a class of current when the url is matched
  def layout_link_to(link_text, path, extra_class)
    curl = url_for(:controller => request.path_parameters['controller'], :action => request.path_parameters['action'])
    html = ''
    options = path == curl ? {:class => "current #{extra_class}"} : {:class => extra_class}
    html << content_tag("li", link_to(link_text, path, options))
  end

  # Creates a list of links and sets the css class to current when the url is matches  
  def tab_for(link_text, path, extra_class)
    curl = url_for(:controller => request.path_parameters['controller'])
    html = ''
    options = path == curl ? {:class => "current #{extra_class}"} : {:class => extra_class}
    html << content_tag("li", link_to(link_text, path, options))
  end

  # Render a submit button and cancel link
  def submit_or_cancel(cancel_url = session[:return_to] ? session[:return_to] : url_for(:action => 'index'), label = 'save')
    content_tag(:div, link_to(image_tag("/images/buttons/cancel.gif"), :back) + "&nbsp;" + image_submit_tag("/images/buttons/#{label}.gif", :class => 'button'), 
    :id => 'submit_or_cancel', :class => 'submit')
  end
  
end
