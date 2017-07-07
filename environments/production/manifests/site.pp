# assign all top scope variables here
#$clientcert = 'foo'
$datacenter = 'datacenter1'

node /foo/ {
  notify{'found foo node': }
}

node default {
  notify{'found default node': }
}

node /bar/ {
  notify{'found bar node': }
}
