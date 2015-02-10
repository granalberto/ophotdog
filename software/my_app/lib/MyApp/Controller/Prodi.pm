package MyApp::Controller::Prodi;
use Mojo::Base 'Mojolicious::Controller';

use Mojo::Pg;


my $pg = Mojo::Pg->new('postgresql://ophotdog:x@192.168.1.9/ophotdog');

my $db = $pg->db;

    
sub show {
    my $self = shift;

    my $results = $db->query('select  prod_n.t as nombre from prod_n, prod_i where (prod_i.prod_n_id=prod_n.id)');
    
    $self->stash(list => $results->hashes);
    
    $self->render(msg => 'Productos Intermedios');
}

1;
    
