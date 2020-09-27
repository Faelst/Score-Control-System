const endPointApi = 'http://localhost:8081/api'

const format = (d) => {
    // `d` is the original data object for the row
    console.log(d)
    return `<div class='d-flex flex-row bd-highlight'>
                    <div class="p-2 bd-highlight">
                            <table class='table-details table-details-1' cellpadding="6" cellspacing="5" border="0" style="padding-left:100px;table-layout: fixed">
                              <tr>
                                <td><i class="fas fa-user-cog"></i>Tecnico:</td>
                                <td class='table-details-data'>${d.technicalName}</td>
                            </tr>
                            <tr>
                                <td><i class="fas fa-cogs"></i><span>Procedimento:</span></td>
                                <td class='table-details-data'>${d.assignmentTypesTitle} / ${d.assignmentLevelsTitle}</td>
                            </tr>
                            <tr>
                                <td><i class="fas fa-user-edit"></i>Responsavel:</td>
                                <td class='table-details-data'>${d.userName}</td>
                            </tr>
                            <tr>
                                <td><i class="fas fa-comment"></i>Observações:</td>
                                <td class='table-details-data'>${d.descriotionService}</td>
                            </tr>
                          </table>
                        </div>
                        <div class="p-2 bd-highlight">
                            <table class='table-details table-details-2' cellpadding="6" cellspacing="5" border="0" style="padding-left:100px;">
                              <tr>
                                <td><i class="fas fa-file-signature"></i>Data de cad.:</td>
                                <td class='table-details-data'>${d.issueDate}</td>
                            </tr>
                            <tr>
                                <td><i class="fas fa-play"></i>Data de exec.:</td>
                                <td class='table-details-data'>${d.executeDate}</td>
                            </tr>
                            <tr>
                                <td><i class="fas fa-star"></i>Pontuação:</td>
                                <td class='table-details-data text-success'>+${d.score} Pts</td>
                            </tr>
                            <tr>
                                <td><i class="fas fa-user-friends"></i>Tecnico Add.:</td>
                                <td class='table-details-data'>${d.addTechinical.length}+</td>
                            </tr>
                          </table>
                        </div>
                        <div class="p-2 bd-highlight">
                        <table class='table-details table-details-3' cellpadding="6" cellspacing="5" border="0" style="padding-left:100px;">
                        
                        ${d.addTechinical && d.addTechinical.map(e => `<tr><td><i class="fas fa-user-plus"></i></td>
                                    <td class='table-details-data'>${e.name}</td>
                                    <td class='table-details-data'>${e.followTypeName}</td>
                                    </tr>`)}
                        `;
}

export default { format }