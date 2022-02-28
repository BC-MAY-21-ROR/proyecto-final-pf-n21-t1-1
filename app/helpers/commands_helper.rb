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
          "name": "chamba_ubicación"
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
        }
      ]
    }
  end
end
