#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set private.for_topre_realforce108u_all_apps 1
/bin/echo -n .
$cli set private.for_topre_realforce108u_exclude_parallels 1
/bin/echo -n .
$cli set private.for_topre_realforce108u_exclude_macvim_terminal_iterm2_parallels 1
/bin/echo -n .
/bin/echo
