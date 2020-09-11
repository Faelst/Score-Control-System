import func from './Functions.js'
import utils from '../utils/DataPickersHeaders.js'


$(document).ready(e => {
  func.loadCities();  // Popular as Cidades no SELECT
  func.loadAssignmentTypes(); // Popular os tipos de solicitação no \SELECT
  func.loadIntegrationErp("0", "0", resp => {
    resp = JSON.parse(resp)
    $("#technicianName").autocomplete({
      source: resp
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

$('#btnRegister').click(e => {
  e.preventDefault();
  const dataForm = $('form').serialize();
  console.log(dataForm);
})

$('#issueDate').datepicker(utils.dataPickersHeraders);

$('#addTechnical').click(e => {
  e.preventDefault();
  $('#addTechnicalModal').modal('show')
});

////////////////////////////////////////////////
$('table > thead > tr > th > a').click(e => {
  e.preventDefault();

  let idRow = 0;

  $.each($(".table tbody tr"), e => idRow++);

  $('table > tbody').append(`<tr id=row${idRow}> <td class="align-middle"> <span name="addTechnicalId${idRow}" id="addTechnicalId${idRow}"></span> </td> <td> <input type="text" class="form-control" id="addTechnicalName${idRow}" name="addTechnicalName${idRow}"  placeholder="Nome do tecnico"></td> <td> <select class="form-control" name="addTechFollowType${idRow}"> <option>Auxiliar</option> <option>Duplado</option> </select> </td> <td> <button class="btn btn-danger row-remove"> <i class="text-align fas fa-trash fa-sm"></i> </button> </td> </tr>`)

  func.loadIntegrationErp("0", "0", resp => {
    resp = JSON.parse(resp)
    $(`#addTechnicalName${idRow}`).autocomplete({
      source: resp
    }).attr('style', 'z-index: 1050 !important;');
  })

  $(`#addTechnicalName${idRow}`).change(e => {
    func.loadIntegrationErp($(`#addTechnicalName${idRow}`).val(), "0", resp => {
      try {
        resp = JSON.parse(resp)
        $(`#addTechnicalId${idRow}`).val(resp[0].id).text(resp[0].id);
      } catch (e) {
        $(`#addTechnicalId${idRow}`).val("").text("");
      }
    })
  })

  $(`tr#row${idRow}`).find("td button.row-remove").on("click", function () {
    e.preventDefault()
    $('#alertToogleAddTechnical').hide('slow').html('')
    $(this).closest("tr").remove();
  });

});
/////////////////////////////////////////////////////////  

/////////////////////////////////////////////////////////  
$('[validate="modal"]').click(e => {

  let erros;

  $("table tbody tr td input").each(async function (index) {
    
    const resp = await func.loadIntegrationErp($(this).val(), "0", calback => {});
    
    try{
      resp = JSON.parse(resp);
    }catch(e){
      console.log(e)
      erros = e
    }
    
    if ($(this).val() == "") {
      $(`tr#row${index}`)
      .hide('slow')
      .remove()
    }
    
  })
  
  console.log(!erros)

  if (!erros) {
    $('#addTechnicalModal').modal('hide')
    $('#alertToogleAddTechnical').html('')
  } else {
    $('#alertToogleAddTechnical')
      .hide()
      .html('<div class="alert-custom alert-danger" role="alert">Verifique se os tecnicos adicionais foram preenchidos corretamente</div>')
      .show('slow');
  }
  
  if (!$("table tbody tr td").length) {
    $('#addTechnicalModal').modal('hide');
    $('#alertToogleAddTechnical').html('');
  }

})
/////////////////////////////////////////////////////////  


// $('#addTechnicalModal').on('shown.bs.modal', function () {

// })

$('#technicialId').change(e => {
  func.loadIntegrationErp("0", $('#technicialId').val(), resp => {
    resp = JSON.parse(resp)
    resp ? $('#technicianName').val(resp[0].label) : $('#technicianName').val("")
  })
})

$('#technicianName').change(e => {
  func.loadIntegrationErp($('#technicianName').val(), "0", resp => {
    resp = JSON.parse(resp)
    resp ? $('#technicialId').val(resp[0].id) : $('#technicialId').val("")
  })
})


