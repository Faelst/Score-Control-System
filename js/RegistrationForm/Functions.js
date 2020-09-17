
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
  $.get(`${endPointApi}/cities`)
    .then(resp => {
      const cities = resp.data
      cities.map(e => $('#serviceCity').append(`<option class='bg-dark text-light' value=${e.id_cidade}>${e.nome_cidade}</option>`))
    })
    .catch(e => {
      alert(`Erro ao carregar as cidades.`)
      console.log(e)
    })
}

const loadAssignmentTypes = _ => {
  $.get(`${endPointApi}/assignmentTypes`)
    .then(resp => {
      const assignmentTypes = resp
      assignmentTypes.map(e => $('#assignmentTypes').append(`<a class="dropdown-item text-light" value=${e.id}>${e.title}</a>`))
    })
    .catch(e => {
      alert(`Erro ao carregar as cidades.`)
      console.log(e)
    })
}

const loadAssignmentTypesLevels = (assignmentTypeId) => {
  $.get(`${endPointApi}/assignmentLevels/${assignmentTypeId}`)
    .then(resp => {
      const levelsAssigmentAtribute = $('#levelsAssigment');
      levelsAssigmentAtribute.html('<option class="bg-dark text-light">Selecionar</option>');
      const levelsAssigment = resp;
      levelsAssigment.map(e => {
        levelsAssigmentAtribute.append(`<option class="bg-dark text-light" value=${e.id} wm-score=${e.score}>${e.title}</option>`);
      })
    }).catch(e => {
      throw new Error(e);
    })
}


const loadIntegrationErp = async (nameTechnician = '0', idTechnician = '0', callback) => {
  const settings = {
    "url": `${endPointApi}/technicals`,
    "method": "POST",
    "headers": {
      "Content-Type": "application/json"
    },
    "data": JSON.stringify({ nameTechnician, idTechnician }),
  };

  return await $.ajax(settings).done(resp => {
      callback(resp.data);
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

  $.map(data, function (value, key) {
    value == "" ? keysNull.push(key) : "";
  })// Flag verifica se a algum campo sem preenchimento atravez de um filter

  if (keysNull.length) {
    keysNull.map(e => {
      console.log(e)
      $(`[name=${e}]`).addClass('invalid-input')
    })
    return false
  }
  return true
}

const postDataForm = async (dataFormArraySerialize, addTechinical) => {
  let sendToData = {}

  $.map(dataFormArraySerialize, (value, key) => {
    sendToData[value.name] = value.value
  })

  if (addTechinical.length) {
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