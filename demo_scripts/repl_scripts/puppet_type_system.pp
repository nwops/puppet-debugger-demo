'string' =~ String
type('String')
'String'.is_a(Boolean)
type(-3)
:set loglevel debug
$password = Sensitive.new(hiera('secret'))