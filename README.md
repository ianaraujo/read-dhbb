# read-dhbb

Código escrito em R para agrupar, ler e organizar os verbetes do Dicionário Histórico Bibliográfico Brasileiro em uma única tabela de dados relacionais. Salva e exporta os dados em um arquivo `.csv`.

Os verbetes do Dicionário Histórico Bibliográfico Brasileiro podem ser acesados por qualquer pessoa em seu [repositório no GitHub](https://github.com/cpdoc/dhbb). No entanto, a tarefa de ler esses arquvios em um software estatístico (Excel, SPSS, etc) ou usando linguagens de programção (R, Python, Julia, etc), transformar em uma base de dados analizável, não é tão simples. Isso torna o dado de difícil manipulação para iniciantes. 

Os verbetes estão dividios em arquivos de textos individuais, dentro do diretório ["text"](https://github.com/cpdoc/dhbb/tree/master/text), onde podem ser visualizados individulamente.

Os verbetes são publicados no seguinte padrão: 

``` 
---
title: COELHO, Machado
natureza: biográfico
sexo: m
cargos:
 - dep. fed. DF 1927-1929 
 - dep. fed. DF 1930
 - const. 1946
 - dep. fed. SP 1946-1951
---

«José Machado Coelho de Castro» nasceu em Lorena (SP).

Estudou no Ginásio Diocesano de São Paulo e bacharelou-se em 1910 pela Faculdade de Ciências Jurídicas e Sociais. Dedicando-se à advocacia, foi promotor público em Cunha (SP) e depois delegado de polícia no Rio de Janeiro, então Distrito Federal. 

[...]
```
