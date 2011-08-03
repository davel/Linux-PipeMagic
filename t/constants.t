#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Linux::PipeMagic;

# XXX - nasty test, assumes constants don't actually change.

is(eval("Linux::PipeMagic::SPLICE_F_MOVE()"), 1) or diag $@;
is(eval("Linux::PipeMagic::SPLICE_F_NONBLOCK()"), 2) or diag $@;
is(eval("Linux::PipeMagic::SPLICE_F_MORE()"), 4) or diag $@;
is(eval("Linux::PipeMagic::SPLICE_F_GIFT()"), 8) or diag $@;

done_testing();

