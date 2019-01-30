class AboutController < ApplicationController
  layout 'brochure'
  before_action :initialize_breadcrumbs

  def index
    active_leftnav_item :main
  end

  def history
    active_leftnav_item :history
    push_breadcrumb('History', '/about-us/history')
  end

  def contact
    active_leftnav_item :contact
    push_breadcrumb('Location and Contact Info', '/about-us/contact')
  end

  protected

  def initialize_breadcrumbs
    push_breadcrumb('About Us', '/about-us')

    add_leftnav_item(:main, 'Who We Are', '/about-us')
    add_leftnav_item(:history, 'History', '/about-us/history')
    add_leftnav_item(:contact, 'Contact/Visit Us', '/about-us/contact')
  end
end
