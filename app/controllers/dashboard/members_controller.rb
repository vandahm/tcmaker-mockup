module Dashboard
  class MembersController < AbstractDashboardController
    before_action :find_member, except: [:create, :index]

    def index
      @members = Member.all
    end

    def show; end

    def update; end

    protected

    def find_member
      return @member unless @member.nil?
      if params['id'] == 'me'
        @member = current_member
      else
        @member = Member.find(params[:id])
      end
      @member
    end
  end
end
