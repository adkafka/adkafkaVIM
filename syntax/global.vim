" Highlight all ines containing Todo or Fixme(globally)
syntax match todoLine "\v.*TODO.*"
syntax match todoLine "\v.*todo.*"
syntax match todoLine "\v.*Todo.*"
syntax match todoLine "\v.*ToDo.*"
syntax match todoLine "\v.*FixMe.*"
syntax match todoLine "\v.*fixme.*"
syntax match todoLine "\v.*Fixme.*"
syntax match todoLine "\v.*FIXME.*"

highlight link todoLine Todo
