divert(-1)
# mh_assert_no_empty(SOME_VARIABLE)
# check if a variable is empty
define(`mh_assert_no_empty',`
    ifelse($1,,`
        errprint(`error(m4_helper): $1 is empty')
        m4exit(1)
    ',)
')

define(`mh_assert_must_define',`
    ifdef($1,,`
        errprint(`error(m4_helper): $1 is not defined')
        m4exit(1)
    ')
')

# foreach(x, (item_1, item_2, ..., item_n), stmt)
#   parenthesized list, simple version
define(`mh_foreach', `pushdef(`$1')mh__foreach($@)popdef(`$1')')
define(`mh__arg1', `$1')
define(`mh__foreach', `ifelse(`$2', `()', `',
  `define(`$1', mh__arg1$2)$3`'$0(`$1', (shift$2), `$3')')')

divert(0)dnl
