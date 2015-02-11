package OpHotdog::Controller::Hotdog;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render(msg => 'Software de Gestión de OpHotDog');
}

1;
