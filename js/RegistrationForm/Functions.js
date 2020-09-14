
const endPointApi = 'http://localhost:8080/api'

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

const validateInput = (dataForm) => {
  
  let data = {}
  let keysNull = []
  
  $('*').removeClass('invalid-input');

  $(dataForm).each((i, obj) => {
    data[obj.name] = obj.value;
  })

  $.map(data, function( value, key ) {
    value == "" ? keysNull.push(key) : "";
  })// Flag verifica se a algum campo sem preenchimento atravez de um filter

  if(keysNull.length){
    keysNull.map(e => {
      console.log(e)
      $(`[name=${e}]`).addClass('invalid-input')
    })
    return false
  }
  return true
}

const postDataForm = async (dataFormArraySerialize,addTechinical) => {
  let sendToData = {}
  
  $.map(dataFormArraySerialize, (value, key) => {
    sendToData[value.name] = value.value
  })
  
  if(addTechinical.length){
    sendToData = {
      ...sendToData,
      addTechinical
    }
  }
  
  $.post(`${endPointApi}/registerSolicitation`, sendToData)
}

export default { 
  clearInputs,
  getCurrentDate,
  loadCities,
  loadAssignmentTypes,
  loadAssignmentTypesLevels,
  loadIntegrationErp,
  validateInput,
  postDataForm
}