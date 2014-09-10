 #.bashrc


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi



# User specific aliases and functions
[ -z "$TMUX" ] && export TERM=xterm-256color
#alias tmux="TERM=xterm-256color tmux"

#eval ('dircolors ~/.dir_colors')
eval $(dircolors ~/.dir_colors)

# enable color support of ls and also add handy aliases
if [ -f ~/.dir_colors ]; then
    test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi




function setmyctroot() { MYCT_ROOT=/home/utrelth/mastering/Mastering${1} ; }
function sme() { setmyctroot Engineering ; }
function smc() { setmyctroot Chemistry ; }
function mxstart() { setmyctroot ${1}; ~/mastering/mx-ctl --no-db-version --service=dev ${2} ${1} start;  }
function mxrestart() { setmyctroot ${1}; ~/mastering/mx-ctl --no-db-version --service=dev ${2} ${1} restart;  }
function mxstop() { setmyctroot ${1}; ~/mastering/mx-ctl --service=dev ${1} stop;  }


#function ll() { eval `perl -Mlocal::lib=$1`; }

function sqlps() { sqlplus dev_ttrela/dev_ttrela@//cluster-b3-20/mastdev @$1 ; }
function sqlpu() { sqlplus $1/$1@//cluster-b3-20/mastdev ; }
function sqlpuscr() { sqlplus $1/$1@//cluster-b3-20/mastdev @$2 ; }
function sqlnetlogclean() { find . -name sqlnet.log -execdir rm {} \; ; }

function aislogs { pushd /export/home/apps/shared-storage/fetched-logs/prd_ais ; }
function work() { pushd ~/work$1 ; }
function wais() { pushd ~/repos-mastering/working-ais/adaptive-inbound/$1 ; }
function ais() { pushd ~/repos-mastering/adaptive-inbound/$1 ; }
function kn() { pushd ~/repos-mastering/knewton/$1 ; }
function ma() { pushd ~/mastering$1 ; }
function mxc() { pushd ~/mxconfig/conf ; }
function myct() { pushd ~/mastering/MyCT$1 ; }
function mxdb() { pushd ~/mxdb/code/20.0$1 ; }
function mxrepo()  { pushd ~/repos-mastering/$1 ; }
function gopage() { pushd ~/mastering/MyCT/base/tt/page ; }
function ga() { pushd ~/mastering/MyCT/base/lib/MyCT/Base/Resource/Interface/Action; }
function gb() { pushd ~/mastering/MyCT/base/lib/MyCT/Base; }
function gbap() { pushd ~/mastering/MyCT/base/lib/MyCT/Base/Assignment/Problem; }
function gcp() { pushd ~/cp; }
function gfet() { pushd /export/home/apps/shared-storage/fetched-logs/ ; }

function gl() { pushd ~/mastering/MyCT/logs; }
function gmx() { pushd ~/mastering/MyCT/base/lib/Mx; }
function gmxt() { pushd ~/mastering/MyCT/base/test/Mx/API/Object/Resource ; }
function gtmxa { pushd ~/mastering/MyCT/base/test/Mx/API/Object/Resource/ContentPlayer; }
function gxs() { pushd ~/mastering/MyCT/base/lib/MyCT/Base/ProblemXML/Solution; }
function gxsa() { pushd ~/mastering/MyCT/base/lib/MyCT/Base/ProblemXML/Solution/Applet; }
function gi() { pushd ~/mastering/MyCT/base/lib/MyCT/Base/Resource/Interface; }
function gr() { pushd ~/mastering/MyCT/base/lib/MyCT/Base/Resource; }
function gojs() { pushd ~/mastering/MyCT/./base/htdocs/assets/ui/js/$1 ; }
function gt() { pushd ~/mastering/MyCT/base/test ; }
function gta() { pushd ~/mastering/MyCT/base/test/MyCT/Base/Resource/Interface/Action ; }
function gtp() { pushd ~/mastering/MyCT/base/test/MyCT/Base/Assignment/Problem ; }
function gtx() { pushd ~/mastering/MyCT/base/test/MyCT/Base/ProblemXML ; }
function gtxs() { pushd ~/mastering/MyCT/base/test/MyCT/Base/ProblemXML/Solution ; }
function gtxsa() { pushd ~/mastering/MyCT/base/test/MyCT/Base/ProblemXML/Solution/Applet ; }
function gtt() { pushd ~/mastering/MyCT/base/templates ; }
function gw() { pushd ~/work/$1 ; }
function gmxa() { pushd ~/work/catalyst-dev/MX-Api/$1 ; }
function gmxc() { pushd ~/work/catalyst-dev/MxCP/$1 ; }
function gomig() { pushd ~/mastering/MyCT/setup/migrations/$1 ; }
function vack() { ack -l "$@" | xargs sh -c 'vim $@ < /dev/tty' ; }
function vimfind() { find . -iname "$1" | xargs sh -c 'vim $@ < /dev/tty' ; }
function gch() { git status -s | grep '^[[:blank:]AMU][[:blank:]:AMU].' | sed 's/\([[:blank:]AMU][[:blank:]AMU].\)\(.*\)/\2/' ; }
function vg() { vim $(gch) ; }
function grns() { find . -exec grep -P -q -i "$1" '{}' \; -print ; }
function grnsp() { find . -name '*.p?' -exec grep -P -q -i "$1" '{}' \; -print ; }
function grnsjs() { find . -name '*.js' -exec grep -P -q -i "$1" '{}' \; -print ; }
function gfl() { pushd /export/home/apps/shared-storage/fetched-logs; }



#function cpr() { 
#    local cf="${HOME}/mxconfig/conf/local.yml";
#    sed 's/^\s*#\+\s*\(contentPlayerOverride\)/\1/' < $cf > x.yml;
#    mv x.yml $cf;
#    local ir=`find ${HOME}/mastering -name itemRender.js -print`;
#    sed 's/\(appConfig.FAKE_ACTION_TIMER =\)\s*300/\1 0/' < $ir  > x.js;
#    mv x.js $ir;
#    local iv=`find ${HOME}/mastering/MyCT/base/lib/MyCT/Base/Resource/Interface/ItemView.pm -print`;
#    sed 's/#\s*\(return $self->redirectToResource(MyCT::Config::getConfig('clientSideProblemRender')\)/\1/' < $iv > x.pm;
#    sed 's/\(return $self->redirectToResource(checkUseNewPlayer($assignmentProblemID) && !$user->isStuden\)/#\1/' < x.pm > xx.pm;
#    mv xx.pm $iv;
#    rm x.pm;
#   mr;
#
#}
#
#function nocpr() {
#    local cf="${HOME}/mxconfig/conf/local.yml";
#    sed 's/contentPlayerOverride/#&/' < $cf > x.yml;
#    mv x.yml $cf;
#    local ir=`find ~/mastering -name itemRender.js -print` ;
#    eed 's/\(appConfig.FAKE_ACTION_TIMER =\)\s*0/\1 300/' < $ir  > x.js;
#    mv x.js $ir;
#    local iv=`find ${HOME}/mastering/MyCT/base/lib/MyCT/Base/Resource/Interface/ItemView.pm -print`;
#    sed 's/\(return $self->redirectToResource(MyCT::Config::getConfig('clientSideProblemRender')\)/#\1/' < $iv > x.pm;
#    sed 's/\(#\s*return $self->redirectToResource(checkUseNewPlayer($assignmentProblemID) && !$user->isStuden\)/#\1/' < x.pm > xx.pm;
#    mv xx.pm $iv;
#    rm x.pm;
#    mr;
#}

source ~/git/contrib/completion/git-completion.bash

# local modules directory
#export 
export MYCT_ROOT=/home/utrelth/mastering/MasteringEngineering
export PERL5LIB="/export/home/apps/public/lib/perl5/site_perl/5.10.0:/export/home/apps/public/lib/perl5/5.10.0:/export/home/apps/public/lib/perl5/site_perl:/export/home/apps/public/lib/perl5:/export/home/apps/public/lib:/home/utrelth/mastering/MyCT/base/lib:/home/utrelth/sage-webservice/lib:${MYCT_ROOT}/product/lib:/home/utrelth/mastering/MyCT/base/test:/home/utrelth/lib"

# export LESS="-F"

#export MXSAGE_ROOT=/home/utrelth/sage-webservice
export MX_CONFIGURATION_BASE=/home/utrelth/mxconfig
export NYTPROF=start=begin:file=/home/utrelth/tmp/nytprof.out:sigexit=1

export GITREPOS=mastxdc03/export/home/apps/data/git-repos


export MxCP_ENV=test

# export MX_DEBUG=1
# export MX_DEBUG_LEVEL=0

# export MXAUTH_DEBUG=1
# export MXAUTH_DEBUG_LEVEL=0

# tell Perl to read and write in unicode (UTF-8)
export PERL_UNICODE=SDL

# set my language environment
export LANG=en_US.utf8
export NLS_LANG=AMERICAN_AMERICA.AL32UTF8

#node.js stuff 
export NODE_CONFIG_PERSIST_ON_CHANGE='N'


# run ssh login for this shell
#. $HOME/.ssh/ssh-login

# find sqlldr
export ORACLE_HOME=/xncpkgs/oracle-11.2.0/product/11.2.0.1 

# new one?: /usr/lib/oracle/11.2/client

# add directories to the path
#export PATH=$ORACLE_HOME/bin:/usr/local/mysql4/bin:/export/home/apps/public/bin:$PATH:/export/home/apps/public/bin:/home/jrefior/beginners:/home/jrefior/beginners/xml
export OLDPATH=$PATH
[ $SHLVL -eq 1 ] && export PATH=$HOME/bin:/export/home/apps/public/java/bin:$ORACLE_HOME/bin:/export/home/apps/public/bin:$OLDPATH:/sbin:$HOME/node_modules/.bin:$(pwd)

# export ORACLE_HOME=/usr/lib/oracle/11.2
export LD_LIBRARY_PATH=/export/home/apps/public/lib:$ORACLE_HOME/client/lib

export EDITOR=vim
export PAGER=less
export HISTSIZE=1000
export HISTCONTROL=erasedups


aislogdir() {
    echo ~/repos-mastering/adaptive-inbound/logs/`date +%Y`/`date +%m`/`date +%d`;
}
aisvl() {
    l `aislogdir`/error_log;
}
aiscl() {
    pushd `aislogdir`;
}

logdir() {
    local product=${MYCT_ROOT##*/};
    echo ~/mastering/$product/logs/$product/`date +%Y`/`date +%m`/`date +%d`;
}

cl() {
    pushd `logdir`;
    #local product=${MYCT_ROOT##*/};
    #pushd ~/mastering/$product/logs/$product/`date +%Y`/`date +%m`/`date +%d`/`date +%H`;
}
vl() {
    l `logdir`/error_log_app;
}


tl() {
    tail -f `logdir`/error_log_app
}


# echo $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
# eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

#. ~/.nvm/nvm.sh > /dev/null
#nvm use 0.10.29 1>/dev/null

source ~/.bashprompt

# [ $SHLVL -eq 1 ] && echo 'shell level =1' 
# [ $SHLVL -eq 1 ] && eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"

echo '------------------'
echo $PERL5LIB  
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"
echo '##################'
echo $PERL5LIB  
