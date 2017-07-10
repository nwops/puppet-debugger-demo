$changedvars = ['fred' => {'old'=>'', 'new'=>'man'}, 'bert was here' => {'old'=>'', 'new'=>'man'}]
debug::break()
$changedvars_metrics = $changedvars.reduce('')| $memo, $entry | {
  $valmungedregsubst = regsubst($entry[0], "[^a-zA-Z0-9]", "_", "G")
  $valmungedinline = inline_template('<%= @entry[0].gsub(/\W/,"_") %>')
  "${memo}${valmungedregsubst}${valmungedinline}"
}