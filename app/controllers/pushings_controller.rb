class PushingsController < ApplicationController



  def home

  end

  def send_sms
    require 'callr'
    api = CALLR::Api.new(ENV['login_api'], ENV['password_api'])
    phone = params["phone"].gsub(/[" "]/, '')
    first_name = params["name"]
    last_name = params["family"]

    if phone.length.between? 10, 12
      add_region = phone.first.gsub(/["0"]/, '+33') + phone[1..11]

      step_of_reconvering = params['step'].to_i

      case step_of_reconvering
      when 1
        if phone.first == "+"
          api.call('sms.send', 'Zenchef', "#{phone}", "Bonjour, j'ai tenté de vous joindre concernant votre facturation. Pourriez-vous me recontacter au 0176440040? Je vous remercie d'avance. Zenchef", nil)
        else
          api.call('sms.send', 'Zenchef', "#{add_region}", "Bonjour, j'ai tenté de vous joindre concernant votre facturation. Pourriez-vous me recontacter au 0176440040? Je vous remercie d'avance. Zenchef", nil)
        end
        @result = "#{params['name']} #{params['family']} a bien reçu le sms de l'étape #{step_of_reconvering}"
      when 2
        if phone.first == "+"
          api.call('sms.send', 'Zenchef', "#{phone}", "Bonjour, certaines de vos factures n'ont pas été réglées. Afin d'eviter la suspension de vos services, merci de me contacter au 0176440040. Zenchef", nil)
        else
          api.call('sms.send', 'Zenchef', "#{add_region}", "Bonjour, certaines de vos factures n'ont pas été réglées. Afin d'eviter la suspension de vos services, merci de me contacter au 0176440040. Zenchef", nil)
        end
        @result = "#{params['name']} #{params['family']} a bien reçu le sms de l'étape #{step_of_reconvering}"
      when 3
        if phone.first == "+"
         api.call('sms.send', 'Zenchef', "#{phone}", "Bonjour, afin d'eviter la suspension de vos services et une majoration de 30%, merci de régler vos factures dans les 8 jours. Zenchef 0176440040", nil)
        else
          api.call('sms.send', 'Zenchef', "#{add_region}", "Bonjour, afin d'eviter la suspension de vos services et une majoration de 30%, merci de régler vos factures dans les 8 jours. Zenchef 0176440040", nil)
        end
         @result = "#{params['name']} #{params['family']} a bien reçu le sms de l'étape #{step_of_reconvering}"
      when 4
        if phone.first == "+"
          api.call('sms.send', 'Zenchef', "#{phone}", "Bonjour, vos factures demeurent impayées. Ces dernières seront donc recouvrées avec une majoration de 30%, votre service est désormais suspendu. Zenchef", nil)
        else
          api.call('sms.send', 'Zenchef', "#{add_region}", "Bonjour, vos factures demeurent impayées. Ces dernières seront donc recouvrées avec une majoration de 30%, votre service est désormais suspendu. Zenchef", nil)
        end
        @result = "#{params['name']} #{params['family']} a bien reçu le sms de l'étape #{step_of_reconvering}"
      end

      flash[:success] = "SMS envoyé à #{last_name} #{first_name}!"
      redirect_to :root
    else
      flash[:error] = 'Le numéro est faux! il contient trop ou pas assez de caractères!'
      redirect_to :root
    end
  end
end
