class PushingsController < ApplicationController

  def home

  end

  def send_sms
    phone = params["phone"].gsub!(/[" "]/, '')

raise
  end
end
