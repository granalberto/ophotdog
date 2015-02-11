package OpHotdog::Controller::Insumos;
use Mojo::Base 'Mojolicious::Controller';

use Mojo::Pg;


my $pg = Mojo::Pg->new('postgresql://ophotdog:x@192.168.1.9/ophotdog');

my $db = $pg->db;

    
sub show {
    my $self = shift;

    my $results = $db->query('select insumo.articulo as articulo,
 unit.medida as medida, insumo.stock as stock from  insumo, unit 
 where (insumo.unit_id = unit.id)');
    
    $self->stash(list => $results->hashes);
    
    $self->render(msg => 'Inventario de Insumos');
}

1;
    
