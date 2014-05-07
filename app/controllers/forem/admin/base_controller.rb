module Forem
  module Admin
    class BaseController < ForemApplicationController
      layout Forem.layout
      
      before_filter :authenticate_forem_admin
      before_filter :inside_admin_area

      def index
        # TODO: perhaps gather some stats here to show on the admin page?
      end

      private

      def authenticate_forem_admin
        if !forem_user || !forem_user.forem_admin?
          flash.alert = t("forem.errors.access_denied")
          redirect_to forums_path #TODO: not positive where to redirect here
        end
      end

      def inside_admin_area
        @inside_admin_area = true
      end
      
    end
  end
end
