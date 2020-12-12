echo 'Start clearing Ex 2 files/data for ' $1 


su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex2.sql -C $JSQSH_CONF -U $1 -P $2"