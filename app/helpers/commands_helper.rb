module CommandsHelper

  def generate_dialog
    dialog_json = {
      "callback_id": "chamba-46e2b0",
      "title": "Agregar una chambita",
      "submit_label": "Agregar",
      "state": "Limo",
      "elements": [
        {
          "type": "text",
          "label": "Titulo de la chamba",
          "name": "chamba_titulo"
        },
        {
          "type": "text",
          "label": "Ubicación",
          "name": "chamba_ubicacion"
        },
        {
          "type": "textarea",
          "label": "Descripción",
          "name": "chamba_descripcion"
        },
        {
          "type": "text",
          "label": "Organización",
          "name": "chamba_organizacion"
        },
        {
          "type": "text",
          "label": "Salario",
          "name": "chamba_salario"
        },
        {
          "type": "text",
          "label": "Puesto",
          "name": "chamba_puesto"
        },
        {
          "type": "text",
          "label": "Requerimientos separados por una coma",
          "name": "chamba_requerimientos"
        },
        {
          "type": "text",
          "label": "Etiquetas",
          "name": "chamba_etiquetas"
        },
        {
          "type": "text",
          "label": "Expiracion",
          "placeholder": "dd/mm/aaaa",
          "name": "chamba_expiracion"
        }
      ]
    }
  end
  def generate_salary_error
    error ={
      "errors": [
        {
          "name": "chamba_salario",
          "error": "El salario tiene que ser un número"
        }
      ]
    }
  end

  def generate_date_error
    error ={
      "errors": [
        {
          "name": "chamba_expiracion",
          "error": "La fecha tiene que ser en el formato dd/mm/aaaa"
        }
      ]
    }
  end

  def generate_errors
    error ={
      "errors": [
        {
          "name": "chamba_salario",
          "error": "El salario tiene que ser un número"
        },
        {
          "name": "chamba_expiracion",
          "error": "La fecha tiene que ser en el formato dd/mm/aaaa"
        }
      ]
    }
  end
  
  def check_date(date)
    begin
      expiracion = Date.parse(date)
    rescue 
      "error"
    else
      true
    end
  end

  def check_salary(salario)
    if salario.match(/\A[+-]?\d+(\.[\d]+)?\z/)
      true
    else
      false
    end
  end
end