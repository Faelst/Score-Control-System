const clearInputs = () => {
  $('#serviceNumber').val('')
  $('#serviceCity').val('')
  $('#issueDate').val('')
  $('#technicianName').val('')
  $('#assignmentType').val('')
  $('#levelsAssigment').val('')
  $('#scoreAmount').val('')
  $('#descriotionService').val('')
}

const getCurrentDate = () => {
  var today = new Date(),
    dd = (today.getDate() + 1).toString().padStart(2, '0'),
    mm = (today.getMonth() + 1).toString().padStart(2, '0'),
    yyyy = today.getFullYear()
  return mm + '/' + dd + '/' + yyyy;
}

const callCadastro = () => {

  var numeroOrdem = $('#nOrdemServico').val()
  var cidade = $('#selectCIdade').val()
  var dataExecucao = $('#dataAbertura').val()
  var dataFechamento = getCurrentDate();
  var tipoOrdenServico = $('#tipoOrdem').val()

  if ($('#tipoOrdem').val() == 'Duplado') {
    var pontuacaoExtra = $('#txPontos').val()
    var motivoPontoExtra = 'Ordem de Serviço Duplada'
  } else {
    var pontuacaoExtra = $('#txtPontosExtra').val()
    var motivoPontoExtra = $('#txtAreaPontoExtra').val()
  }

  var observacao = $('#txtAreaObservação').val();
  var nomeTecnico = $('#nomeTenico').val();

  var nomeTenicoDuplado = $('#nomeTenicoDuplado').val()

  // criação dos paramentros para requisição

  $.ajax({
    url: './php/CadastroAgendamento.php?switchFlag=1',
    cache: 'false',
    method: 'GET',
    async: true,
    dataType: 'html',
    data: {
      numeroOrdem: numeroOrdem,
      cidade: cidade,
      dataExecucao: dataExecucao,
      dataFechamento: dataFechamento,
      tipoOrdenServico: tipoOrdenServico,
      pontuacaoExtra: pontuacaoExtra,
      motivoPontoExtra: motivoPontoExtra,
      observacao: observacao,
      nomeTecnico: nomeTecnico,
      nomeTenicoDuplado: nomeTenicoDuplado,
      check: check
    }
  }).done(function (resp) {
    if (resp == 1) {
      $('#divCheck').html("<img style='width:50%;' src='img/gif/check.gif' />")
      $('#modalCofirmaCadastro').modal('show')
      setTimeout(function () {
        $('#modalCofirmaCadastro').modal('hide')
      }, 1500)
      limparCampos()
    } else {
      alert(resp)
    }
  })
}

const loadCities = _ => {
  $.get('./php/CadastroAgendamento.php?switchFlag=3')
    .then(resp => {
      const cities = JSON.parse(resp)
      cities.map(e => $('#serviceCity').append(`<option class='bg-dark text-light' value=${e.id_cidade}>${decodeURIComponent(escape(e.nome_cidade))}</option>`))
    })
    .catch(e => {
      alert(`Erro ao carregar as cidades.`)
      console.log(e)
    })
}

const loadAssignmentTypes = _ => {
  $.get('./php/CadastroAgendamento.php?switchFlag=4')
    .then(resp => {
      const assignmentTypes = JSON.parse(resp)
      assignmentTypes.map(e => $('#assignmentTypes').append(`<a class="dropdown-item text-light" value=${e.id_procedimento_agendamento}>${decodeURIComponent(escape(e.nomeProcedimento))}</a>`))
    })
    .catch(e => {
      alert(`Erro ao carregar as cidades.`)
      console.log(e)
    })
}

const loadAssignmentTypesLevels = (assignmentTypeId) => {
  $.get(`./php/CadastroAgendamento.php?switchFlag=5&assignmentTypeId=${assignmentTypeId}`)
    .then(resp => {
      const levelsAssigmentAtribute = $('#levelsAssigment');
      levelsAssigmentAtribute.html('<option class="bg-dark text-light">Selecionar</option>');
      const levelsAssigment = JSON.parse(resp);
      levelsAssigment.map(e => {
        levelsAssigmentAtribute.append(`<option class="bg-dark text-light" value=${e.id} wm-score=${e.score}>${e.title}</option>`);
      })
    }).catch(e => {
      throw new Error(e);
    })
}


const loadIntegrationErp = async (nameTechnician = '0', idTechnician = '0', callback) => {

  return await $.get(`./php/CadastroAgendamento.php?switchFlag=6&nameTechnician=${nameTechnician}&idTechnician=${idTechnician}`)
    .done(resp => {
      callback(resp);
      return resp;
    })
    .catch(e => {
      alert(e);
    });

}

export default { clearInputs, getCurrentDate, callCadastro, loadCities, loadAssignmentTypes, loadAssignmentTypesLevels, loadIntegrationErp }