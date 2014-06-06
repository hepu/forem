module Forem
  module PostsHelper
    def forem_avatar(user, options = {})
      image = if Forem.avatar_user_method
        # Try to use the user's custom avatar method
        user.try Forem.avatar_user_method.to_sym
      else
        avatar_url user.forem_email, options
      end

      image_tag image, :alt => "Avatar" if image.present?
    end

    def avatar_url(email, options = {})
      require 'digest/md5' unless defined?(Digest::MD5)
      md5 = Digest::MD5.hexdigest(email.to_s.strip.downcase)

      options[:s] = options.delete(:size) || 60
      options[:d] = options.delete(:default) || default_gravatar
      options.delete(:d) unless options[:d]
      "#{request.ssl? ? 'https://secure' : 'http://www'}.gravatar.com/avatar/#{md5}?#{options.to_param}"
    end

    def default_gravatar
      image = Forem.default_gravatar_image

      case
      when image && URI(image).absolute?
        image
      when image
        request.protocol +
          request.host_with_port +
          path_to_image(image)
      else
        Forem.default_gravatar
      end
    end

    def user_leadership_positions(user)
      leadership_positions = ""
      leadership_users_of_user = @movement.leadership_users.where(user_id: user.id).active
      leadership_users_of_user.each do |lu|
        lp = lu.leadership_position
        jurisdiction = ""
        complete_jurisdiction = lp.get_complete_jurisdiction(user)
        if complete_jurisdiction
          if complete_jurisdiction.is_a? Array
            jurisdiction = " (#{complete_jurisdiction.join(',')})"
          else
            jurisdiction = " (#{complete_jurisdiction})"
          end
        end
        leadership_positions += content_tag :li do |c|
          content_tag :small, lp.name+jurisdiction, class: 'position-name'
        end
      end
      leadership_positions.html_safe
    end
  end
end
