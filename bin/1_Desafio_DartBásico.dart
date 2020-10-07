// Baseado no array acima monte um relatório onde mostre
// Apresente a quantidade de pacientes com mais de 20 anos
// Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia.

void main(List<String> args) {
  var pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|estudante|MG',
    'Sandra Silva|40|estudante|MG',
    'Regina Verne|35|estudante|MG',
    'João Rahman|55|Jornalista|SP'
  ];

  var listaSobrenomeNomePacientes = <String>[''];

  final pacienteComMaisDeXAnos = 20;
  var qtdPacientesComMaisDeXAnos = 0;
  String nomeCompleto;
  String nome;
  String sobrenome;

  for (var paciente in pacientes) {
    if (paciente.split('|')[0].isEmpty) continue;

    if (int.tryParse(paciente.split('|')[1]) > pacienteComMaisDeXAnos) {
      qtdPacientesComMaisDeXAnos++;
    }

    nomeCompleto = paciente.split('|')[0];
    sobrenome = nomeCompleto.split(' ')[
        1]; //Queria pegar o ultima string depois do espeço para garantir que é o sobrenome. Mas existem nomes completos com mais de um sobrenome, como faria para pegar o ultimo sobrenome, garantir que sempre será o último?
    nome = nomeCompleto.split(' ')[0];
    listaSobrenomeNomePacientes.add(sobrenome + '|' + nome);

    // listaIdadePacientes.add(paciente.split('|')[1].);
  }

  print(
      'Temos $qtdPacientesComMaisDeXAnos pacientes com mais de $pacienteComMaisDeXAnos anos de idade.');

  //limpa a variável sobrenome para agrupar print por sobrenome
  sobrenome = '';
  listaSobrenomeNomePacientes.sort();

  for (var sobrenomeNomePaciente in listaSobrenomeNomePacientes) {
    if (sobrenomeNomePaciente.split('|')[0].isEmpty) continue;

    if (sobrenome != sobrenomeNomePaciente.split('|')[0]) {
      sobrenome = sobrenomeNomePaciente.split('|')[0];
      print('<== Pacientes da Família $sobrenome ==>');
    }

    print('--- Nome do Paciente: ${sobrenomeNomePaciente.split('|')[1]}');
  }
}
