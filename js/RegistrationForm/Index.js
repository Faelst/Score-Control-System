import func from './Functions.js'
import utils from '../utils/DataPickersHeaders.js'


$(document).ready(e => {
  func.loadCities();  // Popular as Cidades no SELECT
  func.loadAssignmentTypes(); // Popular os tipos de solicitação no \SELECT
  func.loadIntegrationErp("0", "0", resp => {
    $("#technicianName").autocomplete({
      source: resp.map(e => ({value: e.name , label: e.name}))
    });
  })
})

// Popula os NIVEIS da solicitação de acordo com o tipo de solicitação.
$("div#assignmentTypes").click(e => {
  let assignmentTypeId = e.target.attributes.value.value;
  $("#assignmentType").val(e.target.firstChild.textContent);
  func.loadAssignmentTypesLevels(assignmentTypeId)
})

// Apos trocar do Niveis, seta a pontuação no campo
$('#levelsAssigment').change(e => {
  $("#scoreAmount").val($('#levelsAssigment option:selected').attr('wm-score'));
})

// Limpa todos os campos do formulario.
$('#btnClear').click(e => {
  e.preventDefault();
  func.clearInputs();
  $('table tbody tr').remove();
})

$('#issueDate').datepicker(utils.dataPickersHeraders);

$('#addTechnical').click(e => {
  e.preventDefault();
  $('#addTechnicalModal').modal({
    keyboard: false,
    backdrop: false
  })
});


////////////////////////////////////////////////////////////////////////////////
//  Cuida do comportamento visual e validações da table de tecnico adicional  //
////////////////////////////////////////////////////////////////////////////////
$('table > thead > tr > th > a').click(e => {
  e.preventDefault();

  let idRow = 0;

  $.each($(".table tbody tr"), e => idRow++);

  $('table > tbody').append(`<tr id=row${idRow}> <td class="align-middle"> <span id="addTechnicalId${idRow}"></span> </td> <td> <input type="text" class="form-control" id="addTechnicalName${idRow}"   placeholder="Nome do tecnico"></td> <td> <select class="form-control" > <option>Auxiliar</option> <option>Duplado</option> </select> </td> <td> <button class="btn btn-danger row-remove"> <i class="text-align fas fa-trash fa-sm"></i> </button> </td> </tr>`)

  func.loadIntegrationErp("0", "0", resp => {
    $(`#addTechnicalName${idRow}`).autocomplete({
      source: resp.map(e => e.name)
    }).attr('style', 'z-index: 1050 !important;');
  })

  $(`#addTechnicalName${idRow}`).change(e => {

    if ($(`#addTechnicalName${idRow}`).val()) {

      func.loadIntegrationErp($(`#addTechnicalName${idRow}`).val(), "0", resp => {
        try {
          
          $(`#addTechnicalId${idRow}`).val(resp[0].id).text(resp[0].id);
        } catch (e) {
          $(`#addTechnicalId${idRow}`).val("").html('<i class="fas fa-exclamation-triangle text-danger"></i>');
        }
      })

    } else {

      $(`#addTechnicalId${idRow}`).val("").text("");

    }

  })

  $(`tr#row${idRow}`).find("td button.row-remove").on("click", function () {
    e.preventDefault()
    $('#alertToogleAddTechnical').hide('slow').html('')
    $(this).closest("tr").remove();
  });

});

//  Validação para finanlizar o modal
$('[validate="modal"]').click(e => {

  let erros;

  $("table tbody tr td input").each(async function (index) {

    let resp = await func.loadIntegrationErp($(this).val(), "0", calback => { });

    try {
      resp = resp.data;
    } catch (e) {
      console.log(e)
      erros = e
    }

    if (!erros) {
      $('#addTechnicalModal').modal('hide')
      $('#alertToogleAddTechnical').html('')
    } else {
      $('#alertToogleAddTechnical')
        .hide()
        .html('<div class="alert-custom alert-danger" role="alert">Verifique se os tecnicos adicionais foram preenchidos corretamente</div>')
        .show('slow');
    }

    if ($(this).val() == "") {
      $(`tr#row${index}`)
        .hide('slow')
        .remove()
    }

  })

  if (!$("table tbody tr td").length) {
    $('#addTechnicalModal').modal('hide');
    $('#alertToogleAddTechnical').html('');
  }

})
////////////////////////////////////////////////////////////////////////////////  
////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////  


$('#technicialId').change(e => {
  func.loadIntegrationErp("0", $('#technicialId').val(), resp => {
    resp ? $('#technicianName').val(resp[0].name) : $('#technicianName').val("")
  })
})

$('#technicianName').change(e => {
  func.loadIntegrationErp($('#technicianName').val(), "0", resp => {
    
    resp ? $('#technicialId').val(resp[0].id) : $('#technicialId').val("")
  })
})


$('#btnRegister').click(e => {
  e.preventDefault();
  let addTechinical = []
  $('#addTechinicalTable > tbody > tr').each(function (i) {
    addTechinical.push({
      id: $('tr > td > span').val(),
      name: $('tr > td > input').val(),
      followType: $('tr > td > select').val()
    })
  });

  console.log(addTechinical)
  let dataForm = $('form').serializeArray();

  
  const flag = func.validateInput(dataForm);
  console.log()
  try{
     flag && func.postDataForm(dataForm, addTechinical);
  }catch(e){
    console.log(e)
  }
})


