#!/bin/bash

# GiuSoft Tecnologia
# -------------------------------------------
# Script para automatizar e integrar o
# controle de versão com o sistema de OS
# -------------------------------------------
# Autor  : Giuliano Nascimento
# Data   : 2021-04-25
# Versão : 1.0.2

AMBIENTE="prod"
DEPURAR=1
ARQTMP="/tmp/os-$USER"
PAR=$1
NUM=$2
MMM=$3

function mostra
{
    if [ "$DEPURAR" == "1" ];then
        echo $1 $2 $3
    fi
}

function prepara
{
    # Dados do usuário (do Git)
    EMAIL="$(git config --global user.email)"
    NOME="$(git config --get user.name)"

    # Identifica a OS atual (se estiver trabalhando em uma)
    if git branch | grep "\*" | cut -f2 -d' ' | grep 'os' >/dev/null;then
        O_ATUAL="$(git branch | grep "\*" | cut -f2 -d' ' | cut -f2 -d'/')"
    else
        O_ATUAL="0"
    fi

    # Identifica o SO
    SO="Desconhecido"
    if [ -f /etc/redhat-release ];then
        SO="centos"
    fi
    if [ -f /etc/issue ];then
        if cat /etc/issue | grep -iF "Ubuntu" >/dev/null 2>/dev/null; then
            SO="ubuntu"
        fi
    fi
    if [ "$SO" == "OSX" ];then
        SO="macos"
    fi
    # Ambiente
    if [ "$AMBIENTE" == "dev" ];then
        SRV="http://localhost/gadmin/api.php"
    else
        SRV="https://www.giusoft.com.br/gadmin/api.php"
    fi

    # Cores
    CLIMP="$(tput sgr0)"
    CPRET="$(tput setaf 0)"
    CVERM="$(tput setaf 1)"
    CVERD="$(tput setaf 2)"
    CAMAR="$(tput setaf 3)"
    CAZUL="$(tput setaf 4)"
    CMAGE="$(tput setaf 5)"
    CCIAN="$(tput setaf 6)"
    CBRAN="$(tput setaf 7)"
}

function prepararBranchs
{
    git remote update origin -p

    if git checkout -q develop ;then
        echo "branch develop já existe"
        git pull origin develop
    else
        echo "Branch develop não existe no projeto, criando branch develop"
        [ "$(git branch --show-current)" != "master" ] && git checkout -q master
        git pull origin master
        git checkout -b -q develop ; git push origin develop
    fi

    git pull origin master
    git checkout -q master

}

function instalaRequisitos
{
    mostra "- Instalando requisitos..."
    if [ "$SO" == "macos" ];then
        brew install wget
        brew install gh
    fi
    if [ "$SO" == "ubuntu" ];then
        apt-get -y install wget
        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
        sudo apt-add-repository https://cli.github.com/packages
        sudo apt update
        sudo apt install gh
    fi
    if [ "$SO" == "centos" ];then
        yum -y install wget
        yum -y install snapd
        systemctl enable --now snapd.socket
        ln -s /var/lib/snapd/snap /snap
        echo "Aguarde..."
        sleep 10
        snap install gh
        #sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
        #sudo dnf install gh
    fi
    mostra "- Concluída a instalação de requisitos."
}

function checaRequisitos
{
    hasWget=$(which wget 2>/dev/null)
    hasGh=$(which gh  2>/dev/null)
    hasGit=$(which git  2>/dev/null)

    mostra "- Verificação de requisitos:"
    if [[ -z "$hasWget" || -z "$hasGh" || -z "$hasGit" ]];then
        mostra "-- Aviso! - Packages não encontradas"
        instalaRequisitos
    else
        mostra "-- Dependencias encontradas"

    fi
}

function cabecalho
{
    echo "${CAZUL}OS-CLI da GiuSoft${CLIMP}"
    echo

}

function processaUmaLinhaOS
{
    #echo "$1"
    O_NUM=`echo "$1" | cut -f1 -d';' | tr '~' "\n"`
    O_DATA_CRIACAO=`echo "$1" | cut -f2 -d';' | tr '~' "\n"`
    O_ATENDENTE=`echo "$1" | cut -f3 -d';' | tr '~' "\n"`
    O_DATA_MODIFICACAO=`echo "$1" | cut -f4 -d';' | tr '~' "\n"`
    O_CLIENTE=`echo "$1" | cut -f5 -d';' | tr '~' "\n"`
    O_TIPO=`echo "$1" | cut -f6 -d';' | tr '~' "\n"`
    O_PRIORIDADE=`echo "$1" | cut -f7 -d';' | tr '~' "\n"`
    O_TITULO=`echo "$1" | cut -f8 -d';' | tr '~' "\n"`
    O_DESCRICAO=`echo "$1" | cut -f9 -d';' | tr '~' "\n"`
    O_SITUACAO=`echo "$1" | cut -f10 -d';' | tr '~' "\n"`
}

function mostraUmaLinha
{
    echo -e "OS       : ${CCIAN}$O_NUM${CLIMP} - ${CCIAN}$O_CLIENTE${CLIMP}"
    echo -e "Situação : ${CCIAN}$O_SITUACAO${CLIMP}"
    echo -e "Criada   : ${CCIAN}$O_DATA_CRIACAO${CLIMP}"
    echo -e "Atend.   : ${CCIAN}$O_ATENDENTE${CLIMP}"
    echo -e "Modif.   : ${CCIAN}$O_DATA_MODIFICACAO${CLIMP}"
    if [ "$O_PRIORIDADE" == "01 Urgente (4h)" ];then
        echo -e "Prior.   : ${CVERM}$O_PRIORIDADE${CLIMP}"
    else
        echo -e "Prior.   : ${CCIAN}$O_PRIORIDADE${CLIMP}"
    fi
    echo -e "Tipo     : ${CCIAN}$O_TIPO${CLIMP}"
    echo -e "Título   : ${CCIAN}$O_TITULO${CLIMP}"
    # echo
    # echo -e "${CAMAR}$O_DESCRICAO${CLIMP}"
    # echo
    echo "---"
}

function api
{
    PAR="cmd=os&email=$EMAIL&par=$1&num=$2&msg=$3"
    if [ "$DEPURAR" == "1" ];then
        mostra "$SRV $PAR"
    fi
    curl -k -s -o $ARQTMP -d "$PAR" --url "$SRV"
    # wget -q -O $ARQTMP --post-data "$PAR" $URL
}

function atualizarVersao
{
  [[ ${1} =~ ^(.*[^0-9])?([0-9]+)$ ]]  && \
    [[ ${#BASH_REMATCH[1]} -gt 0 ]] && \
      printf "%s%0${#BASH_REMATCH[2]}d" "${BASH_REMATCH[1]}" "$((10#${BASH_REMATCH[2]} + 1 ))" || \
      printf "%0${#BASH_REMATCH[2]}d" "$((10#${BASH_REMATCH[2]} + 1))" || \
    printf "${1}"
}

function criarTag
{
    tagsExistentes=$(git tag | wc -c)

    if [ $tagsExistentes -eq 0 ];then
        git tag 1.0.0
        git push origin 1.0.0
    else
        ultimaTag=$( git tag -l | sort -V | grep -v help|tail -1)
        novaTag=$(atualizarVersao "$ultimaTag")
        echo "nova Tag: $novaTag"

        git tag "$novaTag"
        git push origin "$novaTag"
    fi
}

# Main
prepara
checaRequisitos
cabecalho

case $1 in
    --help | -h | ajuda | help)
        echo "Uso:  os [comando] [parâmetro/mensagem]"
        echo
        echo "Esses são os comandos possíveis:"
        echo
        echo "  - (nenhum)               Lista todas as OS abertas e pendentes"
        echo "  - ambiente               Configura seu ambiente (usuário, email, repositórios, etc.)"
        echo "  - clonar                 Clona um repositório do GitHub"
        echo "  - abrir                  Abre uma nova OS"
        echo "  - urgente                Abre uma nova OS de maneira simplificada"
        echo "  - obter [minhas]         Pesquisa por uma OS. Informe o parâmetro: Número da OS ou um texto"
        echo "  - buscar                 Pesquisa por uma OS. Informe o parâmetro: Número da OS ou um texto"
        echo "  - ver                    Pesquisa por uma OS. Informe o parâmetro: Número da OS ou um texto"
        echo "  - iniciar                Inicia o atendimento a uma OS (inicia a codificação)"
        echo "  - mudar                  mudar de branch/OS"
        echo "  - adicionar              Adiciona um arquivo para envio ao repositório (git add)"
        echo "  - atualizar              Envia arquivos adicionados para o repositório remoto (git commit e push)"
        echo "  - concluir               Conclui o trabalho de codificação, liberando para testes (merge em develop)"
        echo "  - finalizar [a/r]        Aprova ou reprova os testes de uma OS. Ex: os finalizar"
        echo "  - pendentes              Lista OS's pendentes de aprovação ou reprovação"
        echo "  - publicar               Envia ramificação 'develop' para produção, ou seja, para 'master'"
        echo "  - producao [sistema]     Atualiza o ambiente de produção (depende de permissões)"
        echo "                           Sistema pode ser: webcfc, gadmin, lttransportes, logic, ga, wms_inter"
        echo
        echo "Todos os comandos podem ser resumidos para apenas duas letras."
    ;;

    ambiente | am)
        echo -e "${CAMAR}Preparando ambiente de trabalho${CLIMP}"
        echo
        echo -e -n "${CCIAN}Informe seu nome e o último sobrenome: ${CLIMP}"
        read NOME SOBRE
        echo
        echo -e -n "${CCIAN}Informe seu e-mail corporativo: ${CLIMP}"
        read EMAIL
        echo -e -n "${CCIAN}Informe seu nome de usuário no GitHub: ${CLIMP}"
        read GITHUB
        git config --global user.email "$EMAIL"
        git config --global user.name "$NOME $SOBRE"

        echo -e "${CCIAN}Agora serão instalados os principais repositórios${CLIMP}"
        mkdir -p ~/Projetos/giusoft/www/ 2>/dev/null
        cd ~/Projetos/giusoft/www/
        git clone https://$GITHUB@github.com/giusoft/gfw
        git clone https://$GITHUB@github.com/giusoft/webcfc
        git clone https://$GITHUB@github.com/giusoft/wms
        git clone https://$GITHUB@github.com/giusoft/gadmin
        echo -e "${CVERD}Concuído!${CLIMP}"
    ;;

    abrir | ab)
        echo -e "${CAMAR}Abrindo nova OS:${CLIMP}"
        echo -e "${CCIAN}1/5) Informe o nome do cliente${CLIMP}"
        echo -e "     ([giusoft], inter, animais, logic, etc.)"
        read -p ": " CLIENTE
        echo -e "${CCIAN}2/5) Informe o nome do produto${CLIMP}"
        echo -e "     ([webcfc], teleaula, teorico, temora, moto, wms, outro)"
        read -p ": " PRODUTO
        echo -e "${CCIAN}2/5) Informe a prioridade${CLIMP}"
        echo -e "     ([3=Normal], 2=Importante ou 1=Urgente)"
        read -p ": " PRIORIDADE
        echo -e "${CCIAN}3/5) Informe o tipo de OS${CLIMP}"
        echo -e "     ([1=Correção], 2=Mudança rotina, 3=Novo)"
        read -p ": " TIPO
        echo -e "${CCIAN}4/5) Informe o título${CLIMP}"
        echo -e "     (texto livre resumido)"
        read -p ": " TITULO
        echo -e "${CCIAN}5/5) Informe a descrição da atividade${CLIMP}"
        echo -e "     (texto livre detalhado)"
        read -p ": " DESCRICAO
        if [ "$CLIENTE" == "" ];then
            CLIENTE="GS BA"
        fi
        if [ "$PRODUTO" == "" ];then
            PRODUTO="webcfc"
        fi
        if [ "$PRIORIDADE" == "" ];then
            PRIORIDADE="3"
        fi
        if [ "$TIPO" == "" ];then
            TIPO="1"
        fi

        ID_PROD=0
        case $PRODUTO in
            webcfc) ID_PROD=26 ;;
            teleaula) ID_PROD=29 ;;
            temora) ID_PROD=28 ;;
            teorico) ID_PROD=30 ;;
            moto) ID_PROD=31 ;;
            wms) ID_PROD=4 ;;
            outro) ID_PROD=0 ;;
        esac
        MSG="$CLIENTE~$ID_PROD~$PRIORIDADE~$TIPO~$TITULO~$DESCRICAO"
        api abrir "$MSG"
        if [ "$(cat $ARQTMP | cut -f1 -d';')" == "0" ];then
            echo -e "${CVERM}Ocoreu um erro ao abrir OS!\n$(cat $ARQTMP | cut -f2 -d';')${CLIMP}"
        else
            echo
            echo -e "${CVERD}OS criada $(cat $ARQTMP)!${CLIMP}"
        fi
    ;;

    urgente | ur)
        echo -e "${CAMAR}Abrindo nova OS urgente:${CLIMP}"
        echo -e "${CCIAN}1/2) Informe o título${CLIMP}"
        echo -e "     (texto livre resumido)"
        read -p ": " TITULO
        echo -e "${CCIAN}2/2) Informe o nome do produto${CLIMP}"
        echo -e "     ([webcfc], teleaula, teorico, temora, moto, wms, outro)"
        read -p ": " PRODUTO

        if [ "$PRODUTO" == "" ];then
            PRODUTO="webcfc"
        fi

        ID_PROD=0
        case $PRODUTO in
            webcfc) ID_PROD=26 ;;
            teleaula) ID_PROD=29 ;;
            temora) ID_PROD=28 ;;
            teorico) ID_PROD=30 ;;
            moto) ID_PROD=31 ;;
            wms) ID_PROD=4 ;;
            outro) ID_PROD=0 ;;
        esac
        CLIENTE="GS BA"
        PRIORIDADE=1
        TIPO=11

        MSG="$CLIENTE~$ID_PROD~$PRIORIDADE~$TIPO~$TITULO"
        api abrir "$MSG"
        if [ "$(cat $ARQTMP | cut -f1 -d';')" == "0" ];then
            echo -e "${CVERM}Ocorreu um erro ao abrir OS!\n$(cat $ARQTMP | cut -f2 -d';')${CLIMP}"
        else
            echo
            echo -e "${CVERD}OS criada $(cat $ARQTMP)!${CLIMP}"
        fi
    ;;

    obter | ob | buscar | bu | ver | ve )

        [[ "$NUM" -eq "minhas" ]] && api minhas || api obter $NUM

        while read LINHA
        do
            processaUmaLinhaOS "$LINHA"
            mostraUmaLinha
        done < $ARQTMP
    ;;

    iniciar | in)
        # TODO: Falta verificar se existe a branch 'develop' e 'master'...
        if [ "$NUM" != "" ];then
            O_ENCONTRADA=0
            api obter $NUM
            while read LINHA
            do
                O_ENCONTRADA=1
                processaUmaLinhaOS "$LINHA"
                mostraUmaLinha
            done < $ARQTMP
            if [ "$O_ENCONTRADA" == "1" ];then
                echo -e "${CMAGE}"
                echo -e "$NOME ($EMAIL)"
                while true; do
                    read -p "Confirma início do atendimento desta OS? (s/n) " sn
                    case $sn in
                        [Ss]* )

                            # Verificando se a branch develop existe, e atualizando a mesma
                            prepararBranchs

                            echo -e "${CAMAR}Criando a OS [$NUM] no controle de versão...${CLIMP}"
                            if git checkout -b "os/$NUM";then
                                api iniciar $2
                                echo -e "${CVERD}Pode mandar ver no código agora!${CLIMP}"
                                exit 0
                            else
                                echo -e "${CVERM}Ocoreu um erro ao criar a ramificação!${CLIMP}"
                            fi
                            exit
                        ;;
                        [Nn]* )
                            echo -e "${CLIMP}"
                            exit 1
                        ;;
                        * ) echo "Responda com S ou N!";;
                    esac
                done
                echo -e "${CLIMP}"
            else
                echo -e "${CVERM}A OS informada ($NUM) não foi encontrada!${CLIMP}"
            fi
        else
            echo -e "${CVERM}Você deve informar o número da OS! Exemplo: os iniciar 999 ${CLIMP}"
        fi
    ;;

    mudar | testar | te | mu)
        if [[ -z "$NUM" ]];then
            echo -e "${CVERM}Digite uma OS válida!${CLIMP}"
            exit 1
        else
            if [[ ! -z "$(git status -s -uall | awk '{print $2}' | grep -v "setup.php")" ]];then
                echo -e "${CAMAR}Arquivos não commitados encontrados, tem certeza de que deseja continuar ?"
                read -p "Pressione ENTER para continuar"
            fi

            git fetch origin
            existeLocal=$(git branch --list "os/$NUM")
            existeRemotamente=$(git ls-remote --heads origin "os/$NUM")

            if [[ ! -z "$existeLocal" || ! -z "$existeRemotamente" ]];then
                [[ "$O" != "0" ]] && api mudar "$O_ATUAL~$NUM"
                git checkout "os/$NUM" -q

                [[ "$NUM" -eq "minhas" ]] && api minhas || api obter $NUM

                while read LINHA
                do
                    processaUmaLinhaOS "$LINHA"
                    mostraUmaLinha
                done < $ARQTMP
                echo -e "${CVERD}Branch Atual: os/$NUM !${CLIMP}"

            else
                echo -e "${CVERM}A OS informada ($NUM) não existe, não foi iniciada ou já foi finalizada!${CLIMP}"
                exit 1
            fi
        fi
    ;;

    adicionar | ad)
        git add $NUM
        echo -e "${CVERD}Adicionado a lista de arquivos a enviar: $NUM ${CLIMP}"
    ;;

    atualizar | at)
        if [ "$O_ATUAL" != "0" ];then
            echo -e "${CAMAR}Atualizando OS $O_ATUAL..."
            echo -e "${CLIMP}"
            comentario=$([ -z "$NUM" ] && echo "Atividade sendo executada" || echo "$NUM" )
            # Busca atualizações na develop pra pegar mudanças de outro membro do time
            git pull
            git merge origin develop
            git merge origin master
            if git commit -m"$comentario";then
                if git push origin os/$O_ATUAL;then
                    api atualizar $O_ATUAL "$comentario"
                    echo -e "${CVERD}Alterações enviadas e OS atualizada!${CLIMP}"
                else
                    echo -e "${CVERM}Ocoreu um erro ao enviar alterações para o repositório!${CLIMP}"
                fi
            else
                echo -e "${CVERM}Ocoreu um erro ao realizar o commit!${CLIMP}"
            fi
        else
            echo -e "${CVERM}Você não está em uma ramificação (branch) de OS!${CLIMP}"
        fi
    ;;

    pendentes | pe)
        echo "OS's concluídas aguardando aprovação..."
        gh pr list
    ;;

    concluir | co)
        if [ "$O_ATUAL" != "0" ];then
            O_ENCONTRADA=0
            api obter $O_ATUAL
            while read LINHA
            do
                O_ENCONTRADA=1
                processaUmaLinhaOS "$LINHA"
                mostraUmaLinha
            done < $ARQTMP

            echo -e "${CAMAR}Concluindo OS $O_ATUAL..."
            echo -e "${CLIMP}"
            M="Codificação concluída"
            if [ "$O_TITULO" != "" ];then
                M="$O_TITULO"
            else
                M="$O_DESCRICAO"
            fi
            if ! git commit -m"$M";then
                if git push origin os/$O_ATUAL;then
                    if gh pr create -t "$O_ATUAL - $O_TITULO" -b "$O_DESCRICAO" -B develop -a @me;then
                        api concluir $O_ATUAL "$MMM"
                        git checkout develop
                        git pull origin develop
                        echo -e "${CVERD}OS $O_ATUAL concluída e enviada para teste!${CLIMP}"
                    else
                        echo -e "${CVERM}Ocoreu um erro ao enviar OS para teste!\nVerifique se a ramificação (branch) develop existe...${CLIMP}"
                    fi
                else
                    echo -e "${CVERM}Ocoreu um erro ao enviar alterações para o repositório!\nVerifique se a ramificação (branch) develop existe...${CLIMP}"
                fi
            else
                echo -e "${CVERM}Ocoreu um erro ao realizar o commit!${CLIMP}"
            fi
        else
            echo -e "${CVERM}Você não está em uma ramificação (branch) de OS!${CLIMP}"
        fi
    ;;

    finalizar | fi)
        if [[  "$O_ATUAL" -eq 0 &&  -z "$NUM"  ]];then
            echo -e "${CVERM}Você precisa estar numa OS para aprovar!${CLIMP}"
            echo "Exemplo (Aprovação): os finalizar a"
            echo "Exemplo (Reprovação): os finalizar r"
            exit 1
        else

            api obter $O_ATUAL
            while read LINHA
            do
                O_ENCONTRADA=1
                processaUmaLinhaOS "$LINHA"
                # mostraUmaLinha
            done < $ARQTMP

            case $NUM in
                a)
                    if ! gh pr merge "os/$O_ATUAL" -m -d;then
                        echo -e "${CVERM}Falha ao finalizar OS!${CLIMP}"
                        exit 1
                    fi
                ;;
                r)
                    if ! gh pr close "os/$O_ATUAL";then
                        echo -e "${CVERM}Falha ao finalizar OS!${CLIMP}"
                        exit 1
                    fi
                ;;
                *)
                    echo -e "${CVERM}Falha ao reprovar OS!${CLIMP}"
                    echo "Exemplo (Aprovação): os finalizar a"
                    echo "Exemplo (Reprovação): os finalizar r"
                    exit 1
                ;;
            esac

            if api finalizar $O_ATUAL "$2";then

                if git checkout develop -q;then
                    if git pull origin develop -q;then
                        if git remote update origin -p; then
                            git branch -d os/"$O_ATUAL"
                            echo -e "${CVERD}OS $O_ATUAL finalizada !${CLIMP}"
                            exit 0
                        else
                            echo -e "${CVERM}Falha ao fazer o update remoto!${CLIMP}"
                            exit 1
                        fi
                    else
                        echo -e "${CVERM}Falha ao fazer o pull do develop!${CLIMP}"
                        exit 1
                    fi
                else
                    echo -e "${CVERM}Falha ao mudar pra branch develop!${CLIMP}"
                    exit 1
                fi
            else
                echo -e "${CVERM}Falha ao finalizar OS!${CLIMP}"
                exit 1
            fi
        fi
    ;;

    publicar | pu)
        echo -e "${CAMAR}Atualizando a master, tem certeza de que deseja continuar ?"
        read -p "Pressione ENTER para continuar"
        echo
        git checkout develop
        git pull

        gh pr create -t "release" -b "updating production" -B master -a @me
        gh pr merge develop -m
        criarTag
        git pull
        git checkout master
        git pull
        echo -e "${CVERD}Branch master atualizada !${CLIMP}"
    ;;

    producao | pr)
        echo -e "${CAMAR}Atualizando em ambiente de produção..."
        if [ "$HOSTNAME" == "ide" ];then
            echo
            echo "Aguarde uns 15 segundos..."
            echo
            if git remote -v | grep "fetch" | grep "gadmin" 2>/dev/null >/dev/null;then
                echo "producao gadmin" > /tmp/run/$USER.exec
                sleep 15
                tail -n 10 /var/log/gs_ide.log | grep $USER
            fi
            if git remote -v | grep "fetch" | grep "webcfc" 2>/dev/null >/dev/null;then
                echo "producao webcfc" > /tmp/run/$USER.exec
                sleep 15
                tail -n 10 /var/log/gs_ide.log | grep $USER
            fi
            if git remote -v | grep "fetch" | grep "gfw" 2>/dev/null >/dev/null;then
                echo "producao gfw" > /tmp/run/$USER.exec
                sleep 15
                tail -n 10 /var/log/gs_ide.log | grep $USER
            fi
        else
            if [ "$2" == "gadmin" ];then
                ssh -p 22 -i ~/.ssh/sistemas.key sistemas@132.226.166.119 "cd /var/www/html/gadmin;git pull"
                ssh -p 22 -i ~/.ssh/sistemas.key sistemas@152.67.37.119 "cd /var/www/html/gadmin;git pull"
                ssh -p 22 -i ~/.ssh/sistemas.key sistemas@132.226.162.3 "cd /var/www/html/gadmin;git pull"
            fi
            if [ "$2" == "webcfc" ];then
                ssh -p 22 -i ~/.ssh/sistemas.key sistemas@132.226.166.119 "cd /var/www/html/webcfc;git pull"
                ssh -p 22 -i ~/.ssh/sistemas.key sistemas@152.67.37.119 "cd /var/www/html/webcfc;git pull"
                ssh -p 22 -i ~/.ssh/sistemas.key sistemas@132.226.162.3 "cd /var/www/html/webcfc;git pull"
            fi
            if [ "$2" == "gfw" ];then
                ssh -p 22 -i ~/.ssh/sistemas.key sistemas@132.226.166.119 "cd /var/www/html/gfw;git pull"
                ssh -p 22 -i ~/.ssh/sistemas.key sistemas@152.67.37.119 "cd /var/www/html/gfw;git pull"
                ssh -p 22 -i ~/.ssh/sistemas.key sistemas@132.226.162.3 "cd /var/www/html/gfw;git pull"
            fi
            if [ "$2" == "lttransportes" ];then
                ssh -p 22 -i ~/.ssh/sistemas.key sistemas@132.226.166.119 "cd /var/www/html/lttransportes;git pull"
                ssh -p 22 -i ~/.ssh/sistemas.key sistemas@152.67.37.119 "cd /var/www/html/lttransportes;git pull"
                ssh -p 22 -i ~/.ssh/sistemas.key sistemas@132.226.162.3 "cd /var/www/html/lttransportes;git pull"
            fi
            if [ "$2" == "logic" ];then
                ssh -p 2222 -i ~/.ssh/sistemas.key sistemas@189.89.157.199 "cd /var/www/html/wms;git pull"
            fi
            if [ "$2" == "ga" ];then
                ssh -p 2222 -i ~/.ssh/sistemas.key sistemas@algar.grupoanimais.com "cd /var/www/html/wms;git pull"
            fi
            if [ "$2" == "inter" ];then
                ssh -p 2222 -i ~/.ssh/sistemas.key giusoft@gs.intermaritima.com.br "cd /var/www/html/wmsnovo;git pull"
            fi
            if [ "$2" == "inter_teste" ];then
                ssh -p 2222 -i ~/.ssh/sistemas.key giusoft@gs.intermaritima.com.br "cd /var/www/html/wmsnovoteste;git pull"
            fi
        fi
    ;;

    exec | x)
        echo "Executando: $2 $3 $4 $5 $6"
        echo
        if [ "$2" != "" ];then
            echo "$2 $3 $4 $5 $6" > /tmp/run/$USER.exec
            tail -f /var/log/gs_ide.log
        fi
    ;;

    clonar | clone | cl)
        echo "Clonando repositório: $2"
        echo
        git clone https://github.com/giusoft/$2
    ;;

    *)
        api
        while read LINHA
        do
            processaUmaLinhaOS "$LINHA"
            mostraUmaLinha

        done < $ARQTMP
    ;;
esac
echo "Agora: $(date +%F\ %T)"
