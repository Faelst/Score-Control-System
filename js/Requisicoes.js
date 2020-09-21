
$(document).ready(function () {
    $('tbody').empty();
    $('#example').DataTable({

        "ordering": true,
        "language": {
            "url": "JsonTabela/Portuguese-Brasil.json",
        },
        ajax: {
            url: './php/PopularTables.php?flag=2',
            dataSrc: ''
        },
        columns: [
            { 'data': 'id_tecnico' },
            { 'data': 'Nome_tecnico' },
            { 'data': 'instalacao' },
            { 'data': 'manutencao' },
            { 'data': 'retirada' },
            { 'data': 'vistoria' },
            { 'data': 'rompimento' },
            { 'data': 'duplado' },
            { 'data': 'treinamento_nf' },
            { 'data': 'nao_executado' },
        ]
    });

    var table = $('#example').DataTable();

    table.columns(0).order('desc').draw();


})


$("#dataInicialAtividades").datepicker({
    dateFormat: 'dd/mm/yy',
    dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
    dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
    dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'],
    monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
    monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
    nextText: 'Próximo',
    prevText: 'Anterior'
});

$("#dataFinalAtividades ").datepicker({
    dateFormat: 'dd/mm/yy',
    dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
    dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
    dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'],
    monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
    monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
    nextText: 'Próximo',
    prevText: 'Anterior'
});

/*       filtro por data         */

$('#btnFiltrarAtividades').click(function () {
    filtroAtividades();
})

function filtroAtividades() {

    const dataInicial = $('#dataInicialAtividades').val()
    const dataFinal = $('#dataFinalAtividades').val()

    $.get(`./php/PopularTables.php?flag=2&dataInicialAtividades=${dataInicial}&dataFinalAtividades=${dataFinal}`)
        .done(function (resp) {
            try{
                var jsonData = JSON.parse(resp);
                preencherTabelaAtividadeFiltro(jsonData);
            }catch (e) {
                 alert('nenhuma informação foi encontrada.\nerro:'+e)
                 $('#example').DataTable().clear().draw();
             }
        })

    function preencherTabelaAtividadeFiltro(jsonData) {

        var table = $('#example').DataTable();

        table.clear().draw();

        table.rows.add(jsonData).draw();

        table.columns(1).order('desc').draw();

    }

}
