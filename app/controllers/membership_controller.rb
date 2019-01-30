class MembershipController < ApplicationController
  layout 'brochure'
  before_action :initialize_breadcrumbs

  def index; end

  def join; end

  def rules; end

  protected

  def initialize_breadcrumbs
    push_breadcrumb('Membership', '/membership')
    add_leftnav_item(:main, 'Benefits', '/membership')
    add_leftnav_item(:history, 'How to Join', '/membership/join')
    add_leftnav_item(:contact, 'Rules and Policies', '/membership/rules')
  end
end
