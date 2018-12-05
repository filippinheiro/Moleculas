# Moleculas

## Trabalho de Lógica II

Trabalho de Lógica na linguagem Prolog para reconhecer moléculas

# Para execução do módulo deve ser seguidos os seguintes passos:

## NÃO USE LETRAS MAIÚSCULAS NOS FATOS

1º carregar os átomos da molécula no campo indicado no arquivo molecula.pl seguindo essas especificacoes: 
    atomo(MOLECULA, CODIGO, ELEMENTO).
    onde MOLECULA é o nome que a molécula vai ser referida a partir de agora, CODIGO é o código do átomo e também o nome
    que vai ser designado a ele, e ELEMENTO o nome completo do elemento que ele é na tabela periódica.

2º carregas as ligações simples, duplas ou triplas no campo indicado no arquivo molecula.pl seguindo essas especificacoes: 
    ligacaosimples(MOLECULA, CODIGO1, CODIGO2).
    ligacaodupla(MOLECULA, CODIGO1, CODIGO2).
    ligacaotripla(MOLECULA, CODIGO1, CODIGO2). 
    onde MOLECULA é o nome dado a molécula anteriormente e CODIGO1 e CODIGO2 os códigos dos elementos ligados, o código 
    deve ser o mesmo CODIGO dado ao elemento referido no fato atomo(MOLECULA, CODIGO, ELEMENTO).

3º abrir o terminal swi-prolog e consultar o arquivo moleculas.pl, após isso digite "identifica(MOLECULA)." sendo MOLECULA o nome que foi dado a molécula no código fonte, a resposta será mostrada no terminal.


ps: não foram adicionadas diretivas de importação ou coisas do gênero, então para evitar transtorno, sugiro que coloque os fatos da molécula diretamente em moleculas.pl,
nos campos especificados.
