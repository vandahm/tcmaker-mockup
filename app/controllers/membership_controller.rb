class MembershipController < ApplicationController
  layout 'brochure'
  before_action :initialize_breadcrumbs

  def index
    active_leftnav_item :main
  end

  def join
    active_leftnav_item :join
    push_breadcrumb 'How to Join', '/membership/join'
  end

  def get_involved
    active_leftnav_item :get_involved
    push_breadcrumb 'Getting Involved', '/membership/get-involved'
  end

  def rules
    active_leftnav_item :rules
    push_breadcrumb 'Rules and Policies', '/membership/rules'
  end

  protected

  def initialize_breadcrumbs
    push_breadcrumb('Membership', '/membership')

    add_leftnav_item(:main, 'Benefits', '/membership')
    add_leftnav_item(:join, 'How to Join', '/membership/join')
    add_leftnav_item(:get_involved, 'Getting Involved', '/membership/get-involved')
    add_leftnav_item(:rules, 'Rules and Policies', '/membership/rules')
  end
end
