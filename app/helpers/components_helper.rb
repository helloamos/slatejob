module ComponentsHelper
  def component(name, *options, &block)
    render("./components/alert/#{name}", *options, &block)
  end
end