module ApplicationHelper
  def format_data date
    if date.nil?
      "-"
    else
      date.strftime("%d/%m/%Y")
    end
  end
  def format_moeda valor
    if !valor.nil? && valor >0
    number_to_currency( valor, locale:'pt-br')
    else
    number_to_currency( 0, locale: :'pt-br')
    end
  end
end
