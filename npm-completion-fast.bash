_npm() 
{
    packageScripts="
    const p = require('./package.json');
    Object.keys(p.scripts)
        .forEach(function(key) {
            console.log(key); }
        );
    "

    packageDeps="
    const p = require('./package.json');
    Object.keys(p.dependencies).concat(Object.keys(p.devDependencies))
        .forEach(function(key) {
            console.log(key); }
        );
    "

    npmCommands="
        access adduser bin bugs c cache completion config
        ddp dedupe deprecate dist-tag docs edit explore get
        help help-search i init install install-test it link
        list ln login logout ls outdated owner pack ping
        prefix prune publish rb rebuild repo restart root
        run run-script s se search set shrinkwrap star
        stars start stop t tag team test tst un uninstall
        unpublish unstar up update v version view whoami
    "

    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    case "$prev" in
        run)
            if [ -f 'package.json' ]; then
                opts=$(node -p -e "$packageScripts")
            fi
            ;;
        update|un|uninstall)
            if [ -f 'package.json' ]; then
                opts=$(node -p -e "$packageDeps")
            fi
            ;;
        npm)
            opts=$npmCommands
            ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
    return 0
}
complete -F _npm npm
