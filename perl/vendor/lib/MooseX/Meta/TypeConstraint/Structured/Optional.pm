package ## Hide from PAUSE
  MooseX::Meta::TypeConstraint::Structured::Optional;

use Moose;
use MooseX::Meta::TypeCoercion::Structured::Optional;

extends 'Moose::Meta::TypeConstraint::Parameterizable';

around parameterize => sub {
    my $orig = shift;
    my $self = shift;

    my $ret = $self->$orig(@_);

    $ret->coercion(MooseX::Meta::TypeCoercion::Structured::Optional->new(type_constraint => $ret));

    return $ret;
};

__PACKAGE__->meta->make_immutable(inline_constructor => 0);

1;
