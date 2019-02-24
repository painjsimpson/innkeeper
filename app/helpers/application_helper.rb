module ApplicationHelper
  def card(t="",s="",b="",f="")
    component("card-base", title: t, subtitle: s, body: b, footer: f)

  end
  
  def card_tag(ctitle='', csubtitle='', cbody='', cfooter='')
    render(partial: compath("card-base"), locals: {title: ctitle, subtitle: csubtitle, body: cbody, footer: cfooter})
  end

  def button_tag(label,args)
    parts = {label: label}
    parts[:action] = args[:action] ||= args if args.is_a? String
    parts[:class] = args[:class] ||= "btn " if args[:class].nil?
    parts[:type] = args[:type] ||= "button" if args[:type].nil?

    b = "<button type='".html_safe
    b << parts[:type]
    b << "' class='".html_safe
    b << parts[:class]
    b << "'>".html_safe
    b << parts[:label]
    b << "</button>".html_safe
    b
  end

  def component(component_name, locals = {}, &block)
    name = component_name.split("_").first
    render("components/#{name}/#{component_name}", locals, &block)
  end

  alias c component

  def component_path(component_name)
    name = component_name.split("_").first
    "components/#{name}/#{component_name}"
  end

  alias compath component_path
   # Define the current_user method:
  def current_user
    # Look up the current user based on user_id in the session cookie:
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

   # authroize method redirects user to login page if not logged in:
  def authorize
    redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
  end

   # get date mm-dd-yy
  def get_date(date=Time.current)
    date.strftime('%m-%d-%Y')
  end

  def page_title
    @title ||= "Charin Inn"
  end

  # wrap in tags
  def wrap_tag(tag="")
    opening = '<'.html_safe
    opening << tag 
    opening << '>'.html_safe

    closing = '</'.html_safe
    closing << tag
    closing << '>'.html_safe

    {:pre => opening, :post => closing}
  end

  #use multiple tags for label
  def use_tags(tags=[])
    result = {:pre => "".html_safe, :post => "".html_safe}
    if (tags.is_a? String)
      wrap = wrap_tag :tags
      result[:pre] << wrap[:pre]
      result[:post] << wrap[:post]
    else 
      tags.each do |tag|
        wrap = wrap_tag tag
        result[:pre] << wrap[:pre]
        result[:post] << wrap[:post]
      end
    end
   return result
  end

  def with_tags(text="", tags=[])
    if (tags.is_a? String)
      tags=[tags]
    end
    t = use_tags(tags)
    result = t[:pre] || "" 
    result << text
    result << t[:post] || "" 
    result
  end

  #font-awesome helper
  def link_fa(font="", label="",tags=[])
    if (font.blank?)
      fa = "".html_safe
    else
      fa = " <i class='fa ".html_safe
      fa << font
      fa <<  "'></i> ".html_safe
    end
    if (!label.blank?)
        fa << with_tags(label, tags)
    end
    fa
  end
  alias link_fas link_fa
end
