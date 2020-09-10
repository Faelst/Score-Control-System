import func from './Functions.js'
import utils from '../utils/DataPickersHeaders.js'


$(document).ready(e => {
  func.loadCities();  // Popular as Cidades no SELECT
  func.loadAssignmentTypes(); // Popular os tipos de solicitação no \SELECT
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

$('table > thead > tr > th > a').click(e => {

  e.preventDefault();

  let idRow = 0;

  $.each($(".table tbody tr"), function () {
    idRow++
  });

  $('table > tbody').append(`<tr id=row${idRow}> <td> <input type="text" class="form-control" id="addTechnicalData" name="addTechnicalName${idRow}"  placeholder="Nome do tecnico"></td> <td> <select class="form-control" name="addTechFollowType${idRow}"> <option>Auxiliar</option> <option>Duplado</option> </select> </td> <td> <button class="btn btn-danger row-remove"> <i class="text-align fas fa-trash fa-sm"></i> </button> </td> </tr>`)

  $(`tr#row${idRow}`).find("td button.row-remove").on("click", function () {
    e.preventDefault()
    $(this).closest("tr").remove();
  });

});