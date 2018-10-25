module Dashboard
  class AbstractDashboardController < ApplicationController
    layout 'dashboard'
    before_action :authenticate_member!
  end
end
