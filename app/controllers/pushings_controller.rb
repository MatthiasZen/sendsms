class PushingsController < ApplicationController



  def home

  end

  def send_sms
    require 'callr'
    api = CALLR::Api.new('zenchef', '59Ng8POwYE')
    phone = params["phone"].gsub(/[" "]/, '')
    add_region = phone.first.gsub(/["0"]/, '+33') + phone[1..11]

    step_of_reconvering = params['step'].to_i

    case step_of_reconvering
    when 1
      if phone.first == "+"
        api.call('sms.send', 'Zenchef', "#{phone}", "Bonjour, j'ai tenté de vous joindre concernant votre facturation. Pourriez-vous me recontacter au 0176440040? Je vous remercie d'avance. Matthias Vitte", nil)
      else
        api.call('sms.send', 'Zenchef', "#{add_region}", "Bonjour, j'ai tenté de vous joindre concernant votre facturation. Pourriez-vous me recontacter au 0176440040? Je vous remercie d'avance. Matthias Vitte", nil)
      end
      @result = "#{params['name']} #{params['family']} a bien reçu le sms de l'étape #{step_of_reconvering}"
    when 2
      if phone.first == "+"
        api.call('sms.send', 'Zenchef', "#{phone}", "Bonjour, certaines de vos factures n'ont pas été réglées. Afin d'eviter la suspension de vos services, merci de me contacter au 0176440040. Matthias Vitte", nil)
      else
        api.call('sms.send', 'Zenchef', "#{add_region}", "Bonjour, certaines de vos factures n'ont pas été réglées. Afin d'eviter la suspension de vos services, merci de me contacter au 0176440040. Matthias Vitte", nil)
      end
      @result = "#{params['name']} #{params['family']} a bien reçu le sms de l'étape #{step_of_reconvering}"
    when 3
      if phone.first == "+"
       api.call('sms.send', 'Zenchef', "#{phone}", "Bonjour, afin d'eviter la suspension de vos services et une majoration de 30%, merci de régler vos factures dans les 8 jours. Matthias Vitte 0176440040", nil)
      else
        api.call('sms.send', 'Zenchef', "#{add_region}", "Bonjour, afin d'eviter la suspension de vos services et une majoration de 30%, merci de régler vos factures dans les 8 jours. Matthias Vitte 0176440040", nil)
      end
       @result = "#{params['name']} #{params['family']} a bien reçu le sms de l'étape #{step_of_reconvering}"
    when 4
      if phone.first == "+"
        api.call('sms.send', 'Zenchef', "#{phone}", "Bonjour, vos factures demeurent impayées. Ces dernières seront donc recouvrées avec une majoration de 30%, votre service est désormais suspendu. Matthias Vitte", nil)
      else
        api.call('sms.send', 'Zenchef', "#{add_region}", "Bonjour, vos factures demeurent impayées. Ces dernières seront donc recouvrées avec une majoration de 30%, votre service est désormais suspendu. Matthias Vitte", nil)
      end
      @result = "#{params['name']} #{params['family']} a bien reçu le sms de l'étape #{step_of_reconvering}"
    end

    flash[:notice] = 'SMS envoyé !'
    redirect_to :root

  end
end
