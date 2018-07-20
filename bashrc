# open macdown from the commandline
alias md="open -a MacDown"

SSH_ENV=$HOME/.ssh/environment

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
     echo succeeded
     chmod 600 ${SSH_ENV}
     . ${SSH_ENV} > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -efp ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
