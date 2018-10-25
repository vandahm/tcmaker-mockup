module Dashboard
  class ProfilesController < AbstractDashboardController
    def show
      @profile = current_member
    end

    def update
      @profile = current_member
    end
  end
end
