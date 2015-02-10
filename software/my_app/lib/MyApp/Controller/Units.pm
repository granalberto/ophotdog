package MyApp::Controller::Units;
use Mojo::Base 'Mojolicious::Controller';

use Mojo::Pg;


my $pg = Mojo::Pg->new('postgresql://ophotdog:x@192.168.1.9/ophotdog');

my $db = $pg->db;

    
sub show {
    my $self = shift;

    my $results = $db->query('select medida from unit');
    
    $self->stash(list => $results->hashes);
    
    $self->render(msg => 'Unidades de Medida');
}

1;
    
