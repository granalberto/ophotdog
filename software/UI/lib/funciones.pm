package funciones;

use v5.14;
use Moo;


sub adios {
    my $self = shift;
    say 'Goodbye!';
    exit 0;
}



sub say_welcome {
    my $self = shift;
    say qq/

             OPERACION HOT DOG

  
************************************************
*                                              *
* Bienvenido al Sistema de Gestion de OpHotDog *
*                                              * 
************************************************

/;

}




sub print_list {
    my $self = shift;
    my $list = shift;
    say '';
    for (@{$list}) {
	say $_;
    }
    say '';
}



1;
