# autoload -Uz promptinit
# promptinit
# prompt pure


# z path
. $HOME/z/z.sh  
# source zsh-autosuggestions 
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# path for zsh-completions
fpath=(path/to/zsh-completions/src $fpath)
# source zsh-syntax-highlighting
# source /Users/fuatto/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR="/usr/local/bin/nvim"
export BAT_THEME="TwoDark"

# go-env
export GOROOT="/usr/local/go"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export PATH="/usr/local/bin:$PATH"

# postgresql
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# ecal - aws config for awscli
function awscli-auth() {
     if [ "$AWS_PROFILE" != "ecal-mfa" ]; then
         echo "Current AWS_PROFILE=$AWS_PROFILE, not 'ecal-mfa'"
         echo "(refreshing 'ecal-mfa' anyway...)"
     fi

     code=$1
     auth_json=$(aws sts get-session-token \
         --serial-number arn:aws:iam::184310216834:mfa/vinh_dwarves \
         --token-code $code )

     aws --profile ecal-mfa configure set region us-east-1

     aws --profile ecal-mfa configure set aws_access_key_id \
         $(jq -r '.Credentials.AccessKeyId' <<< "$auth_json")
     aws --profile ecal-mfa configure set aws_secret_access_key \
         $(jq -r '.Credentials.SecretAccessKey' <<< "$auth_json")
     aws --profile ecal-mfa configure set aws_session_token \
         $(jq -r '.Credentials.SessionToken' <<< "$auth_json")
}


export AWS_PROFILE=ecal-mfa

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg -l ""'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


# macro for gocli
cover () {
    local t=$(mktemp -t cover)
    go test $COVERFLAGS -coverprofile=$t $@ \
        && go tool cover -func=$t \
        && unlink $t
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

# alias for emacs
alias enw='TERM=xterm-24bit emacsclient -a "" -t "$@"'
alias em='TERM=xterm-24bit emacsclient -a "" -c "$@"'

alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
export PATH="/usr/local/opt/openssl/bin:$PATH"

export PATH=/Users/fuatto/Library/Python/3.7/bin/:$PATH

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
# [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zshexport PATH="/usr/local/opt/sqlite/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fuatto/gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fuatto/gcloud/google-cloud-sdk/path.zsh.inc'; fi

# The next lingcloud.
if [ -f '/Users/fuatto/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fuatto/gcloud/google-cloud-sdk/completion.zsh.inc'; fi
