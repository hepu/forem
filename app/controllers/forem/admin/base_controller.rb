module Forem
  module Admin
    class BaseController < ForemApplicationController
      layout Forem.layout
      
      def index
        # TODO: perhaps gather some stats here to show on the admin page?
      end
      
    end
  end
end
