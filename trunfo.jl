mutable struct escolhaIA
    skill::Int8
    tipoBatalha::Int8
end

mutable struct carta
    nome::String
    confiabilidade::Int8
    aprendizado::Int8
    eficiencia::Int8
    portabilidade::Int8
    reusabilidade::Int8
end

# ADICIONA UMA NOVA CARTA NO ARRAY DE CARTAS
function addCarta(novaCarta::carta,cartas)
    push!(cartas, novaCarta)
end

# IMPRIME UMA CARTA
function imprimeCarta(carta::carta)
    print("\n************* Carta *************\n")
    print("Nome linguagem: ",carta.nome,"\n")
    print("1. confiabilidade: ",carta.confiabilidade,"\n")
    print("2. aprendizado: ",carta.aprendizado,"\n")
    print("3. eficiencia: ",carta.eficiencia,"\n")
    print("4. portabilidade: ",carta.portabilidade,"\n")
    print("5. reusabilidade: ",carta.reusabilidade,"\n")
end

# IMPRIME PLACAR
function imprimePlacar(cartasJogador,cartasComputador)
    print("************* PLACAR *************\n")
    print("JOGADOR:",length(cartasJogador)," vs ",length(cartasComputador)," COMPUTADOR\n")
end

# CARREGA AS CARTAS DO JOGADOR
function carregaCartas(baralho)
    addCarta(carta("Java",10,7,5,10,10),baralho)
    addCarta(carta("C",0,2,9,5,2),baralho)
    addCarta(carta("Python",9,9,1,9,10),baralho)
    addCarta(carta("C++",6,3,9,4,6),baralho)
    addCarta(carta("C#",10,7,6,7,8),baralho)
    addCarta(carta("Visual Basic .NET",10,8,6,1,9),baralho)
    addCarta(carta("JavaScript",7,5,5,9,5),baralho)
    addCarta(carta("PHP",8,8,7,1,4),baralho)
    addCarta(carta("SQL",0,7,6,4,0),baralho)
    addCarta(carta("Swift",10,3,5,2,4),baralho)
    addCarta(carta("Ruby",10,7,6,1,4),baralho)
    addCarta(carta("Objective-C",10,4,8,2,5),baralho)
    addCarta(carta("Delphi-Object Pascal",9,4,7,3,7),baralho)
    addCarta(carta("Groovy",10,3,6,4,1),baralho)
    addCarta(carta("Assembly language",0,1,10,0,2),baralho)
    addCarta(carta("R",8,8,7,3,4),baralho)
    addCarta(carta("Visual Basic",9,7,5,1,4),baralho)
    addCarta(carta("D",8,6,6,4,2),baralho)
    addCarta(carta("MATLAB",8,5,5,3,3),baralho)
    addCarta(carta("Go",6,6,5,4,4),baralho)
    addCarta(carta("Perl",8,4,6,4,4),baralho)
    addCarta(carta("SAS",0,5,8,2,1),baralho)
    addCarta(carta("PL-SQL",4,6,5,4,1),baralho)
    addCarta(carta("Dart",3,4,6,8,4),baralho)
    addCarta(carta("Rust",6,4,6,4,2),baralho)
    addCarta(carta("Scratch",4,10,2,5,0),baralho)
    addCarta(carta("Lisp",4,3,8,3,1),baralho)
    addCarta(carta("COBOL",4,1,8,1,1),baralho)
    addCarta(carta("Fortran",0,2,8,3,1),baralho)
    addCarta(carta("Julia",11,11,11,11,11),baralho)
end


# DISTRIBUI AS CARTAS
function separaBaralho(baralho,cartasJogador,cartasComputador)
    reveza = true
    while length(baralho) != 0 
        if(reveza == true)
            addCarta(pop!(baralho),cartasJogador)
            reveza = false;
        else
            addCarta(pop!(baralho),cartasComputador)
            reveza = true
        end
    end
end

# EMBARALHA O BARALHO
function embaralhaObaralho(baralho)
    for i = 1:256
        tam = length(baralho)
        muda = rand(1:tam)
        aux = baralho[muda]
        deleteat!(baralho,muda)
        push!(baralho, aux)
    end
end

# COMPARA DUAS CARTA, RETORNA 1 PARA O JOGADOR VECENDO, 0 PARA COMPUTADOR e 2 para empate
function oJogadorGanhou(cartaJogador,cartaComputador,habilidade,tipoBatalha)::Int8
    print("\n************* BATALHA *************")
    print("\nJOGADOR VS COMPUTADOR")
    if habilidade == 1
        print("\nConfiabilidade: ",cartaJogador.nome," ",cartaJogador.confiabilidade,
              " vs ",cartaComputador.confiabilidade," ", cartaComputador.nome,"\n")
    elseif habilidade == 2
        print("\nAprendizado ",cartaJogador.nome," ",cartaJogador.aprendizado,
              " vs ",cartaComputador.aprendizado," ", cartaComputador.nome,"\n")
    elseif habilidade == 3
        print("\nEficiência ",cartaJogador.nome," ",cartaJogador.eficiencia,
              " vs ",cartaComputador.eficiencia," ", cartaComputador.nome,"\n")
    elseif habilidade == 4
        print("\nPortabilidade ",cartaJogador.nome," ",cartaJogador.portabilidade,
              " vs ",cartaComputador.portabilidade," ", cartaComputador.nome,"\n")
    elseif habilidade == 5
        print("\nReusabilidade ",cartaJogador.nome," ",cartaJogador.reusabilidade,
              " vs ",cartaComputador.reusabilidade," ", cartaComputador.nome,"\n")
    else 
        print("\n SKILL INVALIDA\n")
        return -1
    end

    if tipoBatalha == 1 
        print("A MAIOR GANHA!\n")
    elseif tipoBatalha == 2
        print("A MENOR GANHA\n")
    else
        print("BATALHA INVALIDA\n")
        return -1
    end
    if tipoBatalha == 1
        if habilidade == 1
            if cartaJogador.confiabilidade > cartaComputador.confiabilidade
                return 1
            elseif cartaJogador.confiabilidade == cartaComputador.confiabilidade
                return 2
            else 
                return 0
            end
        end
        if habilidade == 2
            if cartaJogador.aprendizado > cartaComputador.aprendizado
                return 1
            elseif cartaJogador.aprendizado == cartaComputador.aprendizado
                return 2
            else 
                return 0
            end
        end
        if habilidade == 3
            if cartaJogador.eficiencia > cartaComputador.eficiencia
                return 1
            elseif cartaJogador.eficiencia == cartaComputador.eficiencia
                return 2
            else 
                return 0
            end
        end
        if habilidade == 4
            if cartaJogador.portabilidade > cartaComputador.portabilidade
                return 1
            elseif cartaJogador.portabilidade == cartaComputador.portabilidade
                return 2
            else 
                return 0
            end
        end
        if habilidade == 5
            if cartaJogador.reusabilidade > cartaComputador.reusabilidade
                return 1
            elseif cartaJogador.reusabilidade == cartaComputador.reusabilidade
                return 2
            else 
                return 0
            end
        end
    elseif  tipoBatalha == 2
        if habilidade == 1
            if cartaJogador.confiabilidade < cartaComputador.confiabilidade
                return 1
            elseif cartaJogador.confiabilidade == cartaComputador.confiabilidade
                return 2
            else 
                return 0
            end
        end
        if habilidade == 2
            if cartaJogador.aprendizado < cartaComputador.aprendizado
                return 1
            elseif cartaJogador.aprendizado == cartaComputador.aprendizado
                return 2
            else 
                return 0
            end
        end
        if habilidade == 3
            if cartaJogador.eficiencia < cartaComputador.eficiencia
                return 1
            elseif cartaJogador.eficiencia == cartaComputador.eficiencia
                return 2
            else 
                return 0
            end
        end
        if habilidade == 4
            if cartaJogador.portabilidade < cartaComputador.portabilidade
                return 1
            elseif cartaJogador.portabilidade == cartaComputador.portabilidade
                return 2
            else 
                return 0
            end
        end
        if habilidade == 5
            if cartaJogador.reusabilidade < cartaComputador.reusabilidade
                return 1
            elseif cartaJogador.reusabilidade == cartaComputador.reusabilidade
                return 2
            else 
                return 0
            end
        end
    end
    return -1;
end


# TOMADA DE DECISÃO COMPUTADOR
function IAcomputador()
    skill = rand(1:5)
    habilidade = rand(1:2)
    return(escolhaIA(skill,habilidade))
end

function iniciaJogo(cartasComputador, cartasJogador, vezDoJogador)
    while true
        if(length(cartasComputador) == 0)
            print("VOCÊ GANHOU!\n")
            return
        elseif(length(cartasJogador) == 0)
            print("O COMPUTADOR GANHOU!\n")
            return
        end
        imprimePlacar(cartasJogador,cartasComputador)
        cartaComputador = popfirst!(cartasComputador)
        cartaJogador = popfirst!(cartasJogador)
        if vezDoJogador == true 
            vezDoJogador = false
            print("Digite 0 para finalizar!\n");
            imprimeCarta(cartaJogador)
            print("\n************* ESCOLHA A HABILIDADE ************* \n")
            print("Digite o numero da habilidade\n")
            habEscolhida = parse(Int8, readline())
            if habEscolhida == 0
                break
            end
            print("\n************* ESCOLHA O TIPO DE BATALHA ************* \n")
            print("1. A maior ganha\n")
            print("2. A menor ganha\n")
            batalhaEscolhida = parse(Int8, readline())
            resultado = oJogadorGanhou(cartaJogador,cartaComputador,habEscolhida,batalhaEscolhida)
        else
            print("\n\n************* VEZ DO COMPUTADOR *************\n\n")
            vezDoJogador = true
            escolhaIA = IAcomputador()
            resultado = oJogadorGanhou(cartaJogador,cartaComputador,escolhaIA.skill,escolhaIA.tipoBatalha)
        end
        if resultado == 1
            print("VOCÊ VENCEU A RODADA!\n")
            addCarta(cartaComputador,cartasJogador)
            addCarta(cartaJogador,cartasJogador)
        elseif resultado == 0
            print("O COMPUTADOR VENCEU A RODADA\n")
            addCarta(cartaComputador,cartasComputador)
            addCarta(cartaJogador,cartasComputador)
        elseif resultado == 2
            print("DEU EMPATE\n")
            addCarta(cartaComputador,cartasComputador)
            addCarta(cartaJogador,cartasJogador)
        else 
            print("nALGO INESPERADO ACONTECEU\n")
        end
        print("\n")
        imprimePlacar(cartasJogador,cartasComputador)
        print("\nPressione uma tecla para continuar...\n")
        readline(stdin)
    end
end

# LISTA DE CARTAS DO JOGADOR E DO COMPUTADOR
baralho = carta[]
cartasJogador = carta[]
cartasComputador = carta[]

# CRIA E SEPARA AS CARTAS
carregaCartas(baralho)
embaralhaObaralho(baralho)
separaBaralho(baralho,cartasJogador,cartasComputador)

# INICIA O JOGO 
iniciaJogo(cartasComputador,cartasJogador,true)