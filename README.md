# vigitel-2023

#### Ferramentas utilizadas:
- R Studio
- Excel

#### Livrarias do R utilizadas:
- data.table (subir microdados com fread)
- dplyr (alterar dados com os pipes %>%)
- bit64 (ler variável "chave" do tipo "integer64")

#### Justificativa da escolha das ferramentas:
Em se tratando de microdados e de uma análise exploratória para responder à questão, utilizei a linguagem R para otimizar o processo e registrar o código para futuras consultas e análises similares. O Excel foi utilizado apenas para compreensão da base a partir do arquivo de "dicionário" disponibilizado.


#### Sequência de resolução:
1. Download dos microdados de 2023 e do dicionário de dados em "https://svs.aids.gov.br/download/Vigitel/"

2. Leitura sobre as metodologias utilizadas pela VIGITEL na publicação "Vigitel Brasil 2023 - Vigilância de Fatores de Risco e Proteção para Doenças Crônicas por Inquérito Telefônico" também disponibilizada no site "www.gov.br" para melhor entendimento sobre o contexto

3. Abertura do dicionário dos dados no Excel e subida dos dados no R studio

4. Identificação das variáveis de interesse pelo dicionário dos dados:
	- sexo: ```q7```
	- posse de plano de saúde: ```q88```
	- realização do exame de Papanicolau: ```q79a```
	- tempo desde a última realização: ```q80```

5. Filtragem apenas das colunas de interesse

6. Cria uma tabela com os dados filtrados que correspondem aos critérios da pergunta "Qual o percentual de mulheres sem plano de saúde que não haviam feito preventivo de câncer de colo de útero (exame papanicolau) há mais de três anos nas capitais brasileiras?" que corresponde à pergunta "Qual o percentual de mulheres sem plano de saúde que HAVIAM FEITO preventivo de câncer de colo de útero (exame papanicolau) há MENOS de três anos nas capitais brasileiras?":
	- ```q7``` == 2 (só mulheres)
	- ```q88``` == 3 (sem plano de saúde)
	- ```q79a``` == 1 (realizaram o exame)
	- ```q80``` %in% (1, 2, 3) (em menos de 3 anos)

7. Somam-se a essa tabela as mulheres sem plano de saúde que não fizeram papanicolau na vida:
    - ```q7``` == 2 (só mulheres)
	- ```q88``` == 3 (sem plano de saúde)
	- ```q79a``` == 2 (não realizaram o exame)

8. Compara-se a quantidade de linhas dessa tabela anterior gerada à quantidade de linhas da tabela com mulheres sem plano de saúde:
	- ```q7``` == 2 (só mulheres)
	- ```q88``` == 3 (sem plano de saúde)

9. Tem-se o valor final que responde a pergunta


