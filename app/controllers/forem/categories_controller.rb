module Forem
  class CategoriesController < ForemApplicationController
    helper 'forem/forums'
    load_and_authorize_resource :class => 'Forem::Category'
  end
end
