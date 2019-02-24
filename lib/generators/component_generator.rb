class ComponentGenerator < Rails::Generators::Base
  argument :component_name, required: true, desc: "Component name, e.g:
  button"

  def create_view_file
    create_file "#{component_path}/_#{component_name}.html.erb" do
      # c("component") is a renderer helper 
      "<--! app/view ex: <%= c(\"#{component_name}\") %> -->\n<div class=\"#{component_name}\">\n</div>\n"
    end
  end

  def create_css_file
    create_file "#{component_path}/#{component_name}.css" do
      # CSS file can't be blank so we slap in this comment
      "/*! CSS for #{component_name}. */\n.#{component_name} {\n}\n"
    end
  end

  def create_js_file
    create_file "#{component_path}/#{component_name}.js" do
      # require component's CSS inside JS automagically
      "import \"./#{component_name}.css\";\n"
    end
  end

  protected

  def component_path
    "frontend/components/#{component_name}"
  end
end
