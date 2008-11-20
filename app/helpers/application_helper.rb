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
  def layout_link_to(link_text, path)
    curl = url_for(:controller => request.path_parameters['controller'],
                          :action => request.path_parameters['action'])
    html = ''
    options = path == curl ? {:class => 'current'} : {}
    html << content_tag("li", link_to(link_text, path, options))
  end

  # Creates a list of links and sets the css class to current when the url is matches  
  def tab_for(tab, link, label=nil)
    content_tag :li, link_to(label||tab.to_s.titleize, link), :class => ("current_tab" if @current_tab == tab)
  end

  # Render a submit button and cancel link
  def submit_or_cancel(cancel_url = session[:return_to] ? session[:return_to] : url_for(:action => 'index'), label = 'Save Changes')
    content_tag(:div, submit_tag(label) + ' or ' +
      link_to('Cancel', cancel_url), :id => 'submit_or_cancel', :class => 'submit')
  end
  
end
