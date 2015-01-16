# encoding: utf-8
require "detect_ie/version"

# include in ApplicationController
module DetectIE
  protected
  # Return version as integer for all IE versions less than 10, returns 10 otherwise since we
  # generally treat 10 the same as Chrome or Firefox.
  def ie_version
    if @force_ie_version
      @force_ie_version
    elsif request.env['HTTP_USER_AGENT'] =~ /MSIE (\d+)\.0/
      $1.to_i
    else
      10
    end
  end

  # Add to template or controller before IE version-dependent code to aid in testing.
  def force_ie_version!(version)
    if defined?(Rails) && Rails.env.production?
      logger.warn "IE version should not be forced in production in environment! Please remove any calls to 'force_ie_version!' before release."
    end
    @force_ie_version = version.to_i
  end

  def ie_8_or_less?
    ie_version <= 8
  end

  def force_ie_8!
    force_ie_version!(8)
  end

  def self.included(base)
    if base.respond_to?(:helper_method)
      base.helper_method(:ie_version, :force_ie_version!, :ie_8_or_less?, :force_ie_8!)
    end
  end
end
