unit module Leap;

sub is-leap-year ($year) is export {
  $year !%% 2;
}
