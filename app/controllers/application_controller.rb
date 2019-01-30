class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :create_breadcrumbs_array
  before_action :create_leftnav_array

  protected

  def layout_by_resource
    return 'auth' if devise_controller?
    return 'application'
  end

  def push_breadcrumb(title, path)
    crumb = OpenStruct.new
    crumb.title = title
    crumb.path = path
    @breadcrumbs << crumb
  end

  def create_breadcrumbs_array
    @breadcrumbs = []
    push_breadcrumb('Home', root_path)
  end

  def create_leftnav_array
    @leftnav_items = []
    @leftnav_items_hash = {}
  end

  def add_leftnav_item(key, name, path)
    item = OpenStruct.new
    item.active = false
    item.name = name
    item.path = path
    @leftnav_items << item
    @leftnav_items_hash[key] = item
  end

  def active_leftnav_item(key)
    @leftnav_items.each {|i| i.active = false }
    @leftnav_items_hash[key].active = true
  end
end
