alias ubvu_test="/home/django/web/frontend/ubervu/manage.py test"
alias ubvu_shell="/home/django/web/frontend/ubervu/manage.py shell"
alias ubvu_prod="ipython /home/django/web/frontend/ubvushell.py production-remote -i"

alias ubvu_pushtesting='/Users/alex/uberVU/thehole/uvscripts/github/push_in_testing.sh'

$branch = git symbolic-ref HEAD | cut -d'/' -f3 | cut -d'-' -f1
alias ubvu_pullrequest="hub pull-request -i $branch"
