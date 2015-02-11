package OpHotdog;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('hotdog#welcome');

  # Route to units controller
  $r->get('/unidades')->to('units#show');

  $r->get('/insumos')->to('insumos#show');

  $r->get('/prodn')->to('prod#show');

  $r->get('/prodi')->to('prodi#show');

  $r->get('/prodf')->to('prodf#show');

  $r->get('/rendimiento')->to('rendi#show');
  
}

1;
