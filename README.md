# Mini Projeto de CM

# Nome e Número do Aluno

António Ventura, 22206512

## Screnshots dos ecrãs

![Screenshot 1](/Users/antonioventura/StudioProjects/mini_projeto/images/dashboard.png)

![Screenshot 2](/Users/antonioventura/StudioProjects/mini_projeto/images/lista.png)

![Screenshot 3](/Users/antonioventura/StudioProjects/mini_projeto/images/registo.png)

![Screenshot 4](/Users/antonioventura/StudioProjects/mini_projeto/images/detalhes.png)

![Screenshot 5](/Users/antonioventura/StudioProjects/mini_projeto/images/dealer.png)

## Criar avaliação

    A criação de uma avaliação é feita através do clique do icone da bottom bar + com a label Registo onde
    é pedido o nome da disciplina, o tipo de avaliação, a data e a hora, a dificuldade e as 
    observações que são opcionais. A dificuldade é um número de 1 a 5, sendo 1 a mais fácil e 5 a
    mais difícil. A data e a hora são pedidas juntas e é possível escolher a data e a hora através
    de um calendário e um relógio, respectivamente. A data e a hora são guardadas no formato
    yyyy/MM/dd HH:mm.

    Depois de preencher todos os campos, é possível clicar no botão de Submeter que irá apresentar
    uma mensagem de sucesso ou erro, dependendo do resultado do preenchimento dos campos. No caso
    de sucesso, é apresentada a seguinte mensagem: "A avaliação foi registada com sucesso."

## Listar avaliação

    A listagem de avaliações é feita através do clique do icone da bottom bar com a label Lista
    onde é apresentada uma lista com todas as avaliações registadas. Das quais 5 são criadas
    previamente de forma a testar e a criar um exemplo de como é apresentada a informação.

## Editar avaliação

    A edição é feita através de um IconButton que aparece no canto direito de cada item
    da lista. Ao clicar no IconButton, pode entrar na página de edição ou então pode aparecer um 
    AlertDialog com seguinte mensagem: "Só podem ser editados registos de avaliações futuras." caso
    a avaliação seja anterior à data atual.

![Screenshot 8](/Users/antonioventura/StudioProjects/mini_projeto/images/editado.png)

    A edição é feita da mesma forma que a criação, com a diferença que os campos já estão 
    preenchidos com a informação da avaliação que se pretende editar e um ElevatedButton para 
    Submeter á esquerda "Salvar".

    No caso de sucesso, é apresentada a seguinte mensagem: 
    "O registo de avaliação selecionado foi editado com sucesso."

![Screenshot 9](/Users/antonioventura/StudioProjects/mini_projeto/images/editadoAceite.png)

## Consultar o detalhe de uma avaliação

    A consulta dos detalhes é feita através do clique no item. Ao clicar no item, é apresentada
    uma página com os detalhes da avaliação. É possível ver o nome da disciplina, o tipo de
    avaliação, a data e a hora, a dificuldade e as observações em mais detalhes.

## Eliminar avaliações

    A eliminação é feita através de um Dismissible que se traduz num swipe da esquerda 
    para a direita no qual aparece a seguinte mensagem de erro caso seja uma avaliação anterior
    à data atual: "Só podem ser eliminados registos de avaliações futuras.".

![Screenshot 6](/Users/antonioventura/StudioProjects/mini_projeto/images/swipe.png)
    
    Caso seja uma avaliação futura, é apresentada a seguinte mensagem de sucesso: "O registo de
    avaliação selecionado foi eliminado com sucesso." e a avaliação é eliminada da lista.

![Screenshot 7](/Users/antonioventura/StudioProjects/mini_projeto/images/swipeEliminado.png)
    
    Também existe um elevatedButton na direita que permite eliminar a avaliação na página
    de edição.

## Testes unitários

    Não foi implementado

## Dealer
    
    Exemplo da mensagem do Dealer caso clique no último item do ecrã da lista para detalhes e depois
    clique no botão de Partilhar:

    Mensagem do Dealer!!
    
    Vamos ter avaliação de Matemática, em 2023/03/17 19:22,com a dificuldade de 3 numa escala de 1 a 5.
    
    Observações para esta avaliação:
    Foi um teste muito difícil

## Dashboard

    O dashboard é feito através do clique do icone da bottom bar com a label Dashboard onde 
    é apresentada a dificuldade média na semana atual e a dificuldade média na próxima semana.
    
    É apresentado também os próximas avaliações que estão marcadas.

## Autoavaliação

    Ao contabilizar todos os pontos espero uma nota final de 15 valores.# mini-projeto-a22206512
