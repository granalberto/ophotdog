#!/usr/bin/env perl

use v5.10;
use warnings;
use strict;
use lib 'lib';
use pgdog;
use Data::Dumper;

my $obj = pgdog->new;

say 'primero con Dumper';
print Dumper $obj->get_units;

say 'ahora con la funcion';
&print_list($obj->get_units);

say 'por ultimo sin funcion';
for (@{$obj->get_units}) {
    say;
}
    
sub print_list {
    my $list = shift;
    for  (@{$list}) {
	say;
    }
}




# say 'ARTICULOS:';

# for (@$obj->get_insumos) {
#     say;
# }

    
# say 'PRODUCTOS INTERMEDIOS:';

# for (@$obj->get_prod_i) {
#     say;
# }

