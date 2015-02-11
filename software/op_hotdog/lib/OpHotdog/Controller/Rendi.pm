package OpHotdog::Controller::Rendi;
use Mojo::Base 'Mojolicious::Controller';

use Mojo::Pg;


my $pg = Mojo::Pg->new('postgresql://ophotdog:x@192.168.1.9/ophotdog');

my $db = $pg->db;

    
sub show {
    my $self = shift;

    my $results = $db->query('select insumo.articulo as insumo, prod_n.t as producto, rend_insumo.n as cantidad from insumo, prod_n, rend_insumo where (rend_insumo.insumo_id = insumo.id) and (rend_insumo.prod_n_id = prod_n.id)');
    
    $self->stash(list => $results->hashes);
    
    $self->render(msg => 'Rendimiento de Productos');
}

1;
    
