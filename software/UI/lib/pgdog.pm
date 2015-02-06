package pgdog;

use Moo;
use DBI;
use DBD::Pg;



my $dbh = DBI->connect("dbi:Pg:dbname=ophotdog;host=192.168.1.9", 
		       'ophotdog',
		       '',
		       {AutoCommit => 0,
		       RaiseError => 1}
    );

sub get_units {
    my $self = shift;
    my $unit = $dbh->selectcol_arrayref("SELECT medida from unit;");
    return $unit;
}

sub get_insumos {
    my $self = shift;
    my $insumo = $dbh->selectcol_arrayref("SELECT articulo FROM insumo;");
    return $insumo;
}

sub get_prod_n {
    my $self = shift;
    my $prod_n = $dbh->selectcol_arrayref("SELECT t FROM prod_n;");
    return $prod_n;
}


sub get_prod_i {
    my $self = shift;
    my $prod_i = $dbh->selectcol_arrayref("SELECT prod_n.t FROM prod_i, prod_n WHERE prod_n.id = prod_i.prod_n_id;");
    return $prod_i;
}

1;

