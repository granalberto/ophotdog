package MyApp::Controller::Prodf;
use Mojo::Base 'Mojolicious::Controller';

use Mojo::Pg;


my $pg = Mojo::Pg->new('postgresql://ophotdog:x@192.168.1.9/ophotdog');

my $db = $pg->db;

    
sub show {
    my $self = shift;

    my $results = $db->query('select  prod_n.t as producto 
 from prod_n, prod_t where (prod_t.prod_n_id = prod_n.id)');
    
    $self->stash(list => $results->hashes);
    
    $self->render(msg => 'Productos Terminados');
}

1;
    
