// Baseado na lista acima.
// 1 - Remover os duplicados
// 2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino
// 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos
//     e mostre a quantidade de pessoas com mais de 18 anos
// 4 - Encontre a pessoa mais velha.

void main(List<String> args) {
  var pessoasDados = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Masculino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];
  //Limpa dados duplicados
  var pessoas = pessoasDados.toSet();

  print(
      'Total de pessoas do sexo Masculino: ${retonarQtdPessoasPorSexo(sexo: 'Masculino', pessoas: pessoas)}');
  print(
      'Total de pessoas do sexo Feminino: ${retonarQtdPessoasPorSexo(sexo: 'Feminino', pessoas: pessoas)}');

  //Filtrar pessoas maiores de 18 anos
  var pessoasMaioresDe18Anos =
      pessoas.where((element) => (int.tryParse(element.split('|')[1]) > 18));

  print(
      'Quantidade de Pessoas Maiores de 18 anos: ${pessoasMaioresDe18Anos.fold(0, (contador, element) => (contador + 1))}');

  var pessoaMaisExperiente = '';
  var maiorIdade = 0;

  for (var pessoa in pessoas) {
    if (maiorIdade < (int.tryParse(pessoa.split('|')[1]))) {
      maiorIdade = (int.tryParse(pessoa.split('|')[1]));
      pessoaMaisExperiente = pessoa.split('|')[0];
    }
  }

  print(
      'A Pessoas mais experiente é a $pessoaMaisExperiente com $maiorIdade anos de Idade!');
}

int retonarQtdPessoasPorSexo({String sexo, Set<String> pessoas}) => pessoas
    .where((element) => element.contains(sexo))
    .fold(0, (contador, element) => contador + 1);
