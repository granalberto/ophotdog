#!/usr/bin/env perl

use v5.10;
use strict;
use warnings;
use lib ('lib');
use pgdog;
use funciones;
#use Data::Dumper;

my $f = funciones->new;

my $obj = pgdog->new;

my $opcion = '0';


my %main_menu = ( '1' => 'Configuracion',
		  '2' => 'Operaciones',
		  '3' => 'Reportes',
		  '4' => 'Salir' );

my %config_menu = ( '1' => 'Unidades',
		    '2' => 'Insumos',
		    '3' => 'Nombre de Productos',
		    '4' => 'Productos Intermedios',
		    '5' => 'Productos Terminados',
		    '6' => 'Menu Principal' );

my %ops_menu = ( '1' => 'Ventas',
		 '2' => 'Compras',
		 '3' => 'Ajustes',
		 '4' => 'Menu Principal' );

my %reps_menu = ( '1' => 'Ventas',
		  '2' => 'Rentabilidad' );


my %generic_menu = ( '1' => 'Ver',
		   '2' => 'Agregar',
		   '3' => 'Modificar' );



while (1) {

    given ($opcion) {
	
	when (0) {&display_main;}
	when (1) {&menu_conf;}
	when (2) {&menu_ops;}
	when (3) {&menu_reps;}
	when (4) {$f->adios;}
	
	default { &display_main; }
	
    }
    
}

    


sub display_main {

    system("clear");
    
    $f->say_welcome;

    &main_loop;

}


sub main_loop {
    
    for my $op ( sort keys %main_menu) {
	say "$op ----> $main_menu{$op}";
    };
    
    print "Seleccione una opcion: ";

    my $input = <>;

    $opcion = chomp($input);
}



sub menu_conf {

    &op_conf;
    
    given ($opcion) {
	
	when (1) {&conf_menu_1;}
	when (2) {&conf_menu_2;}
	when (3) {&conf_menu_3;}
	when (4) {say 'not ready';}
	when (5) {say 'not ready';}
	when (6) {&display_main;}
	
	default { &menu_conf }
    }
}


sub op_conf {
       
    for my $op ( sort keys %config_menu) {
	say "$op ----> $config_menu{$op}";
    }
    
    print "Seleccione una opcion: ";

    my $input = <>;

    $opcion = chomp $input;

}

sub conf_menu_1 {

    for my $op ( sort keys %generic_menu ) {
	say "$op -----> $generic_menu{$op}";
    }

    print "Seleccione una opcion: ";

    my $input = <>;

    $opcion = $input;

    given ($opcion) {

       	when (1) {$f->print_list($obj->get_units); &op_conf;}
	
	when (2) {say 'not ready';}

	when (3) {say 'not ready';}

	default { &op_conf; }

    }

    &op_conf;

}

sub conf_menu_2 {

    for my $op ( sort keys %generic_menu ) {
	say "$op -----> $generic_menu{$op}";
    }

    print "Seleccione una opcion: ";

    my $input = <>;

    $opcion = chomp $input;

    given ($opcion) {

	when (1) {$f->print_list($obj->get_insumos);}

	when (2) {say 'not ready';}

	when (3) {say 'not ready';}

	default { &op_conf; }

    }

    &op_conf;

}

sub conf_menu_3 {

    for my $op ( sort keys %generic_menu ) {
	say "$op -----> $generic_menu{$op}";
    }

    print "Seleccione una opcion: ";

    my $input = <>;

    $opcion = chomp $input;

    given ($opcion) {

	when (1) {$f->print_list($obj->get_prod_n);}

	when (2) {say 'not ready';}

	when (3) {say 'not ready';}

	default { &op_conf; }

    }

    &op_conf;

}






sub menu_ops {
    say 'not ready';
    &main_loop;
}

sub menu_reps {
    say 'not ready';
    &main_loop;
    
}

